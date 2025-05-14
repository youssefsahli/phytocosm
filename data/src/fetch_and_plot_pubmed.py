import subprocess
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import argparse
import re
from pathlib import Path


def fetch_pubmed_data(molecule, output_file):
    query = f'esearch -db pubmed -query "{molecule}" | efetch -format docsum | xtract -pattern DocumentSummary -element Id,PubDate'
    try:
        result = subprocess.run(query, shell=True, check=True, capture_output=True, text=True)
        with open(output_file, 'w') as f:
            f.write(result.stdout)
    except subprocess.CalledProcessError as e:
        print("Error fetching data:", e.stderr)
        exit(1)


def plot_hits_per_year(tsv_file, molecule):
    df = pd.read_csv(tsv_file, sep="\t", names=["PMID", "PubDate"], dtype=str)
    df["Year"] = df["PubDate"].str.extract(r"(\d{4})").astype(float).astype("Int64")
    df = df.dropna(subset=["Year"])
    year_counts = df["Year"].value_counts().sort_index()

    plt.figure(figsize=(10, 5))
    sns.barplot(x=year_counts.index, y=year_counts.values, palette="crest")
    plt.xlabel("Year")
    plt.ylabel("Nombre de publications")
    plt.title(f"Publications par année pour '{molecule}'")
    plt.xticks(rotation=45)
    plt.tight_layout()
    plt.grid(axis='y')

    output_path = Path(tsv_file).with_suffix(".png")
    plt.savefig(output_path)
    plt.show()


def main():
    parser = argparse.ArgumentParser(description="Fetch PubMed data and plot yearly hits.")
    parser.add_argument("molecule", help="Name of the molecule to search for (PubMed query)")
    args = parser.parse_args()

    tsv_file = f"{args.molecule}_pmids.tsv"
    fetch_pubmed_data(args.molecule, tsv_file)
    plot_hits_per_year(tsv_file, args.molecule)


if __name__ == "__main__":
    main()
