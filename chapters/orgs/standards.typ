#import "/template.typ": *
#import "/boxes.typ": *

#set heading(
  numbering: (.., last) => "▮",
  outlined: false
)

#show heading: h => context {
  let hcontent = box(
    width: 100%,
    outset: (top: 5pt, left: 4pt),
    fill: gray.lighten(70%).transparentize(50%),
    align(horizon, h)
  )

  let margin = page.where()
  let size = measure(hcontent)
  v(1em)
  hcontent 
  linebreak()
}

== Ecocert <Ecocert>
Créé en 1991, Ecocert est le premier organisme certificateur privé. L’organisme audite et certifie en effet plus de 70 000 opérateurs implantés dans 27 pays où il est présent et localisé dans plus de 130 pays. Il réalise plus de 300 000 audits par an portant sur des secteurs très variés, dont les cosmétiques, les détergents ou l’agroalimentaire. @noauthor_ecocert_nodate. En ce qui concerne la cosmétique, Ecocert est membre de l’entité de contrôle du référentiel COSMOS, cadre qui regroupe différentes exigences des parties prenantes européennes, dans le but de définir des exigences communes pour les produits biologiques et naturels. À ce jour, plus de 38 000 produits sont certifiés au titre de cette marque. @noauthor_cosmos_nodate

== ISO 16128 <ISO16128>
Créée et développée en 2016-2017 par l’ISO, la norme ISO 16128 définit des lignes directrices sur les définitions de "produit naturel", d’origine biologique et de dérivation naturelle qui servent à estimer le pourcentage d’ingrédients dits naturels dans un produit cosmétique. Elle est en effet régulièrement critiquée pour sa faiblesse puisque la norme permet de qualifier de « naturel » des ingrédients chimiquement transformés si leur origine végétale ou minérale est prouvée. @noauthor_iso_nodate

== COSMOS <COSMOS>
Le label COSMOS (COSMetic Organic Standard), conçu à partir de la fusion de plusieurs normes européennes (Ecocert, BDIH, Cosmebio, ICEA et Soil Association), est de portée internationale et divisé en deux niveaux, COSMOS Organic et COSMOS Natural, et indique la présence d’un pourcentage minimum d’ingrédients biologiques (sans OGM, ni nanoparticules, ni agents de synthèse agressifs), de formules biodégradables, d’emballages éco-conçus (audit tous les ans) ; à ce jour, environ 40 000 produits sont certifiés. @cosmos_cosmos_2024

== BDIH <BDIH>
L’organisme allemand, BDIH, créé en 2001, fait partie des premiers à établir des standards pour la cosmétique naturelle contrôlée (*kontrollierte Naturkosmetik*), en interdisant dérivés pétrochimiques, colorants et parfums synthétiques, mais également tests sur animaux. Il favorise les extraits de plantes issus de l’agriculture biologique mais son exigence est néanmoins jugée parfois en deçà de celle affichée par COSMOS. @noauthor_bdih_nodate

== NATRUE <NATRUE>
Créé en 2007, le label international NATRUE se distingue par une classification en trois catégories : « cosmétiques naturels », « cosmétiques naturels avec une part bio » et « cosmétiques bio » @noauthor_natrue_nodate-1. Ce label impose des critères de formulation particulièrement stricts et exige un étiquetage clair, sans ambiguïté. La certification n’est pas réalisée par NATRUE lui-même mais confiée à des organismes indépendants. À la différence de la norme ISO16128, NATRUE rejette l’utilisation d’ingrédients issus de procédés synthétiques, même s’ils proviennent à l’origine de sources naturelles (@noauthor_natrue_nodate).

== UEBT <UEBT>
L’Union for Ethical BioTrade (UEBT) ne délivre pas de certification pour les produits finis, mais évalue les chaînes d’approvisionnement des ingrédients naturels. Elle vise à garantir la traçabilité, le respect de la biodiversité, ainsi que l’équité sociale dans les pratiques de récolte des ressources végétales. Bien que cette certification demeure relativement méconnue du grand public, elle gagne en reconnaissance auprès des marques engagées dans des démarches éthiques et durables (@uebt_board_uebt_2020).

== RSPO <RSPO>
La Roundtable on Sustainable Palm Oil (RSPO) encadre la production d’huile de palme selon des critères de durabilité stricts. Elle proscrit notamment la déforestation, promeut le respect des droits des communautés locales et encourage une gestion raisonnée des sols. Dans le secteur cosmétique, les dérivés de l’huile de palme — tels que le glycéryl stéarate ou le sodium palmate — sont nombreux, rendant la traçabilité des matières premières particulièrement complexe et essentielle. Bien que la certification RSPO ne soit pas spécifiquement conçue pour les produits cosmétiques, elle y acquiert progressivement une légitimité croissante. 

== COSMEBIO <COSMEBIO>
Créée en 2002, l’association COSMEBIO regroupe plus de 400 adhérents (marques, laboratoires, fournisseurs) engagés dans la cosmétique naturelle et biologique. Elle est à l’origine de l’un des premiers cahiers des charges bio appliqués à la cosmétique, qui a ensuite été intégré dans le standard COSMOS. Au-delà de la certification, COSMEBIO agit comme structure de représentation professionnelle, de plaidoyer éthique, et de sensibilisation des consommateurs. Elle reste une actrice influente dans les débats autour de la réglementation européenne sur les produits « green ».

== ICEA <ICEA>
L’ICEA (*Istituto per la Certificazione Etica e Ambientale*), basé en Italie, est l’un des organismes fondateurs du label COSMOS. Il évalue la conformité écologique et éthique de produits cosmétiques, textiles et agroalimentaires. Il impose des audits de traçabilité et d’origine biologique, tout en intégrant des critères sociaux dans ses contrôles. L’ICEA est particulièrement actif dans la promotion d’un sourcing responsable des ingrédients végétaux, notamment pour les marques méditerranéennes.

== Soil Association <SoilAssoc>
Organisme britannique créé en 1946, la Soil Association est spécialisée dans la certification biologique. Elle fut l’un des membres fondateurs du standard COSMOS @cosper_understanding_nodate. Son cahier des charges pour la cosmétique exige un pourcentage minimal d’ingrédients bio, interdit les tests sur animaux, les OGM, et les substances pétrochimiques. C'est dans le secteur anglais un acteur majeur avec une forte implication dans les campagnes de sensibilisation autour de l’agriculture durable et des choix de consommation éthique.

== Demeter <Demeter>
Demeter est le label international de l’agriculture biodynamique. Bien que marginal dans le domaine cosmétique, il est considéré comme le référentiel le plus strict en matière de culture et de transformation. Quelques marques de niche utilisent des extraits végétaux certifiés Demeter, notamment dans les cosmétiques anthroposophiques ou artisanaux.

== Fair for Life / Fairtrade <Fairtrade>
Ces certifications ne portent pas directement sur les cosmétiques finis, mais sur les filières de production des ingrédients. Fair for Life, soutenue par Ecocert, et Fairtrade International garantissent une juste rémunération des producteurs, le respect des droits sociaux, et une gestion durable des ressources naturelles. Elles sont fréquemment apposées sur les matières premières végétales sensibles (karité, cacao, huile d’argan, vanille), ajoutant une dimension éthique aux produits certifiés bio.

== Nature & Progrès <NatureetProg>
Label associatif indépendant, Nature & Progrès a été l’un des premiers référentiels bio en France, antérieur à COSMOS. Son cahier des charges repose sur une vision militante et exigeante : interdiction stricte des substances issues de la pétrochimie, audits participatifs, transparence maximale. Bien qu’en marge des certifications industrielles dominantes, il reste un label de référence dans les circuits alternatifs et les marques artisanales.

== NSF/ANSI 305 <NSF>
Aux États-Unis, la norme NSF/ANSI 305 encadre les cosmétiques contenant des ingrédients bio. Moins stricte que les labels européens, elle autorise certaines transformations chimiques dès lors que l’origine végétale est attestée. Cette norme permet l’affichage de la mention « contains organic ingredients » à partir de 70 % de contenu certifié. Elle reflète une approche plus souple de la naturalité, souvent critiquée pour son potentiel à entretenir le *greenwashing*.

== Leaping Bunny <LeapingBunny>
Le label Leaping Bunny, géré par Cruelty Free International, certifie que les produits cosmétiques et leurs ingrédients n’ont pas été testés sur les animaux à aucune étape de leur développement. Bien qu’il ne traite pas de naturalité ou d’origine végétale, il est souvent revendiqué par les marques positionnées sur des cosmétiques éthiques ou « végans ».

== Vegan Society <VeganSociety>
Créée en 1944, la Vegan Society propose un label certifiant l’absence totale d’ingrédients d’origine animale, ainsi que l’absence de tests sur animaux. Ce label est de plus en plus recherché dans les formulations végétaliennes, y compris phytocosmétiques, bien qu’il n’exige pas de pourcentage d’ingrédients naturels ou biologiques.
