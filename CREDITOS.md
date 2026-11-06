# Créditos y licencias — GREASE ME UP!

## Contenido original del proyecto

Todo lo siguiente se ha creado para este proyecto y se genera desde código versionado en Tools/:

- **Modelos 3D** (coches "Fiasco Pulga" y "Pijot Barón", los coches modernos de marcas parodia —Siesta Ibicenca, Volksvago Golfo, Audaz Cuarto, Coyota Raviolo, Porchi 119, Hamborguini Doblequeso y Brabucón G-Ordo—, piezas, motores, mecánico segmentado de respaldo, objetos, mobiliario, el elevador profesional, las estanterías, la máquina de tabaco, el chalé y la mansión): generados con scripts de Blender en Tools/blender/ (build_vehicles_characters.py, build_modern_cars.py, build_items_env.py, build_iter3.py…build_iter6.py). Diseños ficticios, sin parecido intencionado con vehículos, marcas o personajes reales. Las personas se generan con MakeHuman a partir de recursos CC0 (ver «Personas y accesorios»). Los brazos en primera persona (build_iter3.py) y sus texturas de piel y uñas son geometría y dibujo procedurales propios.
- **Marcas de coches y de tabaco**: nombres de parodia inventados para el juego (por ejemplo Hamborguini, Volksvago, Bienmoro, Dromedario, Carolina Slims). Los emblemas, cajetillas y etiquetas son dibujos propios; no se usa ningún logotipo, tipografía de marca ni diseño real.
- **Efectos de sonido, ambientes y música**: sintetizados con Tools/audio/gen_sfx.py (numpy). Sin muestras ni grabaciones de terceros. Las voces habladas de los personajes se generan con síntesis de voz (ver «Voces»).
- **Texturas, calcos, iconos, sprites de interfaz, logotipo y carteles**: generados con Tools/textures/gen_textures.py y Tools/textures/gen_iter10.py (Pillow + numpy): incluye las cajetillas de la máquina de tabaco, la guía de motores y aceites, los carteles de «Se vende» y «¡Vendido!», la placa, la señal de suelo mojado y las pantallas de la tele y del ordenador.
- **Código** del juego, herramientas del editor y pruebas: GreaseMeUp/Assets/GreaseMeUp/Scripts/.

## Personas y accesorios (recursos CC0 de MakeHuman)

Desde noviembre de 2026 las personas de People.fbx y los accesorios de Accessories.fbx vuelven a hacerse con MakeHuman, ahora con texturas. Tools/blender/build_people.py carga con la extensión MPFB 2 (herramienta GPL que solo se ejecuta dentro de Blender; el juego no lleva nada de su código) el cuerpo base, los *targets* de forma y de cara, el esqueleto, la ropa, los zapatos, el pelo, los ojos, las cejas, las pestañas y las pieles del paquete «MakeHuman system assets». Todos esos recursos son **CC0 1.0** (dominio público); los detalles, con URL y SHA-256, están en Tools/thirdparty/mpfb/SOURCE.txt y Tools/thirdparty/makehuman_system_assets/SOURCE.txt.

El juego distribuye las mallas derivadas y también **texturas derivadas** de esos recursos (Tools/blender/out/textures/people/): pieles, iris, cejas, pestañas, pelo, ropa y zapatos, reducidas y pasadas a gris neutro para que Unity las tiña. La CC0 lo permite sin atribución; se cita igualmente por cortesía: «MakeHuman system assets — comunidad MakeHuman (CC0)». A algunas camisetas se les ha borrado el logotipo de MakeHuman.

Son texturas procedurales propias:

- los mechones de barbas, bigotes y rapados (card_facial);
- los tejidos de punto y de algodón;
- las equipaciones de los famosos (colores, rayas, franjas, números y letras);
- los tatuajes.

Los famosos del juego son parodias con nombre inventado. Se reconocen por complexión, altura, pelo, barba, ropa, colores y dorsal, no por la cara: sus caras son combinaciones de *targets* de MakeHuman y no imitan a nadie. No llevan logotipos, escudos, patrocinadores ni equipaciones reales.

La versión de dibujos de la iteración 10 (geometría procedural propia, sin recursos de terceros) queda en Tools/blender/build_people_cartoon.py, que no se ejecuta.

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
| MPFB 2 «MakeHuman Plugin For Blender» (herramienta que genera las personas, no se distribuye; en Tools/thirdparty/mpfb/repo) | 2.0.18 | GPL-3.0-or-later (código); sus datos y el paquete «MakeHuman system assets» son CC0 |
| Piper TTS piper-tts (herramienta de generación de voz, no se distribuye; instalada en Tools/thirdparty/piper/venv) | 1.8.0 | GPL-3.0-or-later (no afecta al audio generado) |

## Voces (síntesis de voz, generadas con Tools/audio/gen_voices.py)

Frases pregrabadas (Audio/SFX/vo_*.wav) sintetizadas sin conexión con Piper a partir de modelos de voz publicados en https://huggingface.co/rhasspy/piper-voices (consultado el 2026-10-31; licencia del conjunto de datos según el MODEL_CARD de cada voz). Los modelos se guardan en Tools/thirdparty/piper/voices/ y no se distribuyen con el juego; algunas voces se derivan con cambio de tono.

| Voz del juego | Modelo | Licencia del dataset | Atribución |
|---|---|---|---|
| m1, m3, dealer | es_ES-davefx-medium | CC0 | — |
| m2, f1, f2, f3, insp | es_ES-sharvard-medium (hablantes M y F) | CC BY 3.0 | «Sharvard corpus», Universidad de Edimburgo, https://datashare.ed.ac.uk/handle/10283/574. **Debe aparecer en los créditos del juego.** |
| c_llamas, c_bestia, c_rolando, c_pegor, c_chocas, c_alondra, c_bunuelo (famosos) | es_ES-davefx-medium con cambio de tono y ritmo | CC0 | — |
| c_grifo, c_orsloco, c_mesa, c_rubio, c_salvaje, c_nadar, f_pastelas, f_chaquira, f_rosaleda (famosos) | es_ES-sharvard-medium (hablantes M y F) con cambio de tono y ritmo | CC BY 3.0 | La misma atribución del corpus Sharvard. |
| c_juanjo, c_playa, c_gasoil, c_mbaguette (famosos) | es_ES-carlfm-x_low con cambio de tono y ritmo | Dominio público («License: Public domain» en su MODEL_CARD, consultado el 2026-11-06; datos: https://github.com/carlfm01/my-speech-datasets) | — |

Los famosos del juego son parodias: sus voces son sintéticas, hechas solo con estos modelos genéricos, y **no imitan ni clonan la voz de ninguna persona real**. Sus frases son originales.

## Algoritmos

- IMA ADPCM (códec de voz): algoritmo público de la Interactive Multimedia Association, implementación propia.
