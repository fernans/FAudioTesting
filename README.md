# FAudioTesting

FAudioTesting is the demo / test application for the FAudio library (https://github.com/fernans/FAudio). It is an iOS application (Objective-C++ / UIKit, Xcode) that loads the FAudio audio-processing graph through the `FAudioWrapper` API, linked against `libFAudio.a` built from the sibling `../FAudio` project. It offers a minimal UI (buffer/frames sliders, preset file field) and ships with a collection of XML audio-graph presets (vocoder, exorcist, vader, wawa, piano, megaphone...) and example carrier WAVs (droid, lightsaber, walkie, possessed voices) used as test material.

> **This project is shared ONLY for educational purposes. Its use, direct or derived, for professional or economic purposes is not permitted.**

Note: for security reasons, some parts of the project may have been edited or removed (e.g. personal paths and local build artifacts replaced or excluded).

**Dependency: this project is a test/demo application for the FAudio project and depends on it.**
You must clone/build FAudio first (https://github.com/fernans/FAudio); the Xcode project expects it as a sibling folder (`../FAudio`) and links the static library it produces (`../FAudio/build/*/libFAudio.a`). The presets XML/XIB are loaded at runtime through `FAudioWrapper`.

**Requirements / How to run**

- Xcode (targets iOS, 2010-era project; armv6/armv7/i386), macOS machine required to build.
- Objective-C++ (`.mm`) with UIKit plus the FAudio static library.
- Clone this repo and the FAudio repo side by side (`parent/FAudio` + `parent/FAudioTesting`), open `FAudioTesting.xcodeproj` in Xcode, build the FAudio static library first, then run the `FAudioTestingDevice` / simulator target on an iOS device or simulator.
- It is an audio app: grant microphone permission when prompted.

DISCLAIMER: This software is provided "as is", without any warranty of any kind. The author accepts no liability for any errors or damages resulting from its use.

**AI training**: the use of the content of this repository (code, assets, documentation) to train or fine-tune machine learning models or AI systems is expressly **not permitted**. All of the repository is licensed under CC-BY-NC-4.0 (see the `LICENSE` file).

---

# FAudioTesting

FAudioTesting es la aplicación demo / de pruebas de la librería FAudio (https://github.com/fernans/FAudio). Es una aplicación iOS (Objective-C++ / UIKit, Xcode) que carga el grafo de audio de FAudio a través de la API de `FAudioWrapper`, enlazando contra `libFAudio.a` generada por el proyecto hermano `../FAudio`. Ofrece una UI mínima (sliders de buffers/frames, campo de archivo de preset) e incluye una colección de presets XML de grafos de audio (vocoder, exorcist, vader, wawa, piano, megáfono...) y WAVs de portadora de ejemplo (droid, sables de luz, walkie, voces possesionadas) usados como material de test.

> **Este proyecto se comparte SOLO con valor educativo. No está permitido su uso (directo o derivado) para fines profesionales o económicos.**

Nota: por motivos de seguridad, es posible que algunas partes del proyecto se encuentren editadas o eliminadas (p. ej. rutas personales y artefactos de build locales han sido sustituidos o excluidos).

**Dependencia: este proyecto es la aplicación de prueba del proyecto FAudio y depende de él.**
Debes clonar y compilar primero FAudio (https://github.com/fernans/FAudio); el proyecto de Xcode lo espera como carpeta hermana (`../FAudio`) y enlaza la librería estática que genera (`../FAudio/build/*/libFAudio.a`). Los presets XML y las XIB se cargan en ejecución a través de `FAudioWrapper`.

**Requisitos / Cómo ejecutar**

- Xcode (orientado a iOS, proyecto de la era 2010; armv6/armv7/i386). Se necesita una máquina macOS para compilar.
- Objective-C++ (`.mm`) con UIKit más la librería estática FAudio.
- Clona este repo y el repo de FAudio uno al lado del otro (`padre/FAudio` + `padre/FAudioTesting`), abre `FAudioTesting.xcodeproj` en Xcode, compila primero la librería estática de FAudio y después lanza el target `FAudioTestingDevice` / simulador en un dispositivo o simulador iOS.
- Es una app de audio: concede el permiso de micrófono cuando lo pida.

AVISO: Este software se ofrece "tal cual", sin ningún tipo de garantía. El autor no asume responsabilidad alguna por posibles errores o daños derivados de su uso.

**Entrenamiento de IA**: no se permite expresamente el uso del contenido de este repositorio (código, recursos, documentación) para entrenar o ajustar (*fine-tune*) modelos de aprendizaje automático o sistemas de IA. Todo el repositorio se publica con licencia CC-BY-NC-4.0 (ver el archivo `LICENSE`).
