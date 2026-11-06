# Créditos y licencias — GREASE ME UP!

## Contenido original del proyecto

Todo lo siguiente se ha creado para este proyecto y se genera desde código versionado en Tools/:

- Modelos 3D (coches "Fiasco Pulga" y "Bravucón Barón", piezas, motores, mecánico segmentado de respaldo, objetos y mobiliario): generados con scripts de Blender en Tools/blender/ (build_vehicles_characters.py, build_items_env.py). Diseños ficticios, sin parecido intencionado con vehículos, marcas o personajes reales. Las personas y los accesorios derivan de recursos CC0 de MakeHuman (ver «Personas y accesorios»).
- Efectos de sonido, ambientes y música: sintetizados con Tools/audio/gen_sfx.py (numpy). Sin muestras ni grabaciones de terceros. Las voces habladas de los personajes se generan con síntesis de voz (ver «Voces»).
- Texturas, calcos, iconos, sprites de interfaz, logotipo y carteles: generados con Tools/textures/gen_textures.py (Pillow + numpy).
- Código del juego, herramientas del editor y pruebas: GreaseMeUp/Assets/GreaseMeUp/Scripts/.

## Personas y accesorios (MakeHuman, CC0)

Los cuerpos de People.fbx y los accesorios de Accessories.fbx se generan con Tools/blender/build_people.py a partir de recursos de MakeHuman, cargados con la extensión oficial MPFB 2 para Blender. Los recursos «core» de MakeHuman son CC0 (dominio público): no exigen atribución ni pago y se pueden usar en un juego comercial de código cerrado. Descargas, SHA-256 y notas en Tools/thirdparty/*/SOURCE.txt (las descargas no se distribuyen con el juego). Licencias comprobadas en las páginas oficiales el 2026-10-31.

| Qué | De dónde | Licencia | URL | Fecha |
|---|---|---|---|---|
| Malla base, *targets* (edad, sexo, peso, musculatura, proporciones, etnia, barriga, papada) y pesos del esqueleto game_engine de MakeHuman | Datos incluidos en la extensión MPFB 2.0.18 (Tools/thirdparty/mpfb/) | CC0 («released as CC0 in september 2020», cabecera de cada fichero; https://static.makehumancommunity.org/about/license.html) | https://extensions.blender.org/add-ons/mpfb/ | 2026-10-31 |
| «MakeHuman system assets»: ropa (male_worksuit01, male_casualsuit03/04/06, female_casualsuit01, female_elegantsuit01), zapatos shoes01–06, ojos low-poly, cejas, pestañas y pelo (short01–04, ponytail01, long01, afro01) | Paquete makehuman_system_assets_cc0.zip (Tools/thirdparty/makehuman_system_assets/) | CC0 (las 94 entradas del índice packs/makehuman_system_assets.json y las cabeceras de los ficheros) | https://static.makehumancommunity.org/assets/assetpacks/makehuman_system_assets.html | 2026-10-31 |
| Uso en juegos cerrados de modelos hechos con MPFB | FAQ oficial | «All core assets (the base mesh, targets, skins…) are shared under CC0» | https://static.makehumancommunity.org/mpfb/faq/use_in_closed_source.html | 2026-10-31 |

Las mallas se transforman en el proyecto (pose de reposo, 13 huesos, recorte de manos, ropa reclasificada en materiales de la paleta sin texturas, diezmado, pelo convertido en volumen sólido); gorras, gafas, barbas, bigotes, cadenas, corbata, toalla y cinturón son geometría propia ajustada a esa cabeza y ese torso.

## Fuentes tipográficas (SIL Open Font License 1.1)

Descargadas de github.com/google/fonts; cada carpeta incluye su OFL.txt y SOURCE.txt (URL y SHA-256).

| Fuente | Uso | Origen |
|---|---|---|
| Bangers (Vernon Adams) | Logotipo, títulos | https://raw.githubusercontent.com/google/fonts/main/ofl/bangers/Bangers-Regular.ttf |
| Barlow Condensed (Jeremy Tribby) | Texto de interfaz | https://raw.githubusercontent.com/google/fonts/main/ofl/barlowcondensed/ |
| Black Ops One (James Grieshaber, Eben Sorkin) | Carteles estarcidos | https://raw.githubusercontent.com/google/fonts/main/ofl/blackopsone/BlackOpsOne-Regular.ttf |

## Software y paquetes

| Componente | Versión | Licencia |
|---|---|---|
| Unity Editor | 6000.3.27f2 (6.3 LTS) | Unity Personal (EULA de Unity; licencia del autor) |
| Netcode for GameObjects | 2.13.3 | Unity Companion License |
| Unity Transport | 2.7.4 | Unity Companion License |
| Universal Render Pipeline, Input System, uGUI/TextMeshPro, Test Framework | versiones de la plantilla 6.3 | Unity Companion License |
| Steamworks.NET | 2025.165.0 | MIT (Riley Labrecque) |
| Steamworks SDK (steam_api64.dll, redistribuido por Steamworks.NET) | incluido en el paquete | Steamworks SDK Access Agreement de Valve |
| Blender (herramienta de generación, no se distribuye) | 5.2.3 LTS | GPL (no afecta a los modelos exportados) |
| MPFB 2 «MakeHuman Plugin For Blender» (herramienta de generación, no se distribuye; en Tools/thirdparty/mpfb/repo) | 2.0.18 | GPL-3.0-or-later (código); sus datos son CC0 (ver «Personas y accesorios») |
| Piper TTS piper-tts (herramienta de generación de voz, no se distribuye; instalada en Tools/thirdparty/piper/venv) | 1.8.0 | GPL-3.0-or-later (no afecta al audio generado) |

## Voces (síntesis de voz, generadas con Tools/audio/gen_voices.py)

Frases pregrabadas (Audio/SFX/vo_*.wav) sintetizadas sin conexión con Piper a partir de modelos de voz publicados en https://huggingface.co/rhasspy/piper-voices (consultado el 2026-10-31; licencia del conjunto de datos según el MODEL_CARD de cada voz). Los modelos se guardan en Tools/thirdparty/piper/voices/ y no se distribuyen con el juego; algunas voces se derivan con cambio de tono.

| Voz del juego | Modelo | Licencia del dataset | Atribución |
|---|---|---|---|
| m1, m3, dealer | es_ES-davefx-medium | CC0 | — |
| m2, f1, f2, f3, insp | es_ES-sharvard-medium (hablantes M y F) | CC BY 3.0 | «Sharvard corpus», Universidad de Edimburgo, https://datashare.ed.ac.uk/handle/10283/574. Debe aparecer en los créditos del juego. |

## Algoritmos

- IMA ADPCM (códec de voz): algoritmo público de la Interactive Multimedia Association, implementación propia.
