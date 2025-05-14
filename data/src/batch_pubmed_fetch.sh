#!/bin/bash

MOLECULES=(
  "bakuchiol"
  "centella asiatica"
  "glabridin"
  "ellagic acid"
  "bisabolol"
  "epigallocatechin"
  "ferulic acid"
  "resveratrol"
  "nigella sativa"
)

for mol in "${MOLECULES[@]}"; do
  echo "▶ Processing: $mol"
  python fetch_and_plot_pubmed.py "$mol"
done
