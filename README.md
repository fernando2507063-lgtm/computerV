# MoodMeter 📊🎭 — Decodificador de Expresiones Faciales con IA

**MoodMeter** es un playground interactivo y didáctico de visión por computadora diseñado para analizar emociones y microexpresiones faciales en tiempo real. 

Impulsado por **FastAPI** en el backend y la librería de aprendizaje profundo **DeepFace**, el sistema traduce capturas de video en distribuciones de probabilidad emocional usando una **Red Neuronal Convolucional (CNN)** de última generación y despliega un dashboard con estética premium **Glassmorphism en Modo Oscuro** junto con explicaciones conceptuales integradas.

---

## 🧠 ¿Cómo Decodifica la IA las Emociones?

A diferencia de las computadoras, los seres humanos percibimos expresiones faciales de forma instantánea y subconsciente. Para que una máquina replique esto, implementa un pipeline convolucional jerárquico paso a paso:

```
[ Entrada: Webcam o Foto ]
          │
          ▼
[ Detector de Rostro (OpenCV) ] ──> Recorta el rostro y alinea ojos y boca.
          │
          ▼
[ Capas Convolucionales de la CNN ] ──> Extraen rasgos abstractos (comisura de labios, cejas).
          │
          ▼
[ Capa Completamente Conectada ] ──> Genera 7 puntuaciones brutas (logits) de emoción.
          │
          ▼
[ Función de Activación Softmax ] ──> Normaliza los logits en probabilidades (suman 100%).
          │
          ├───────────────────────────┐
          ▼                           ▼
[ Medidores Neón en Vivo ]     [ Curva Dinámica (Mood Timeline) ]
```

### La Matemática Detrás: Función Softmax
La última capa de la red de emociones arroja puntuaciones crudas ($z_i$) para cada emoción básica. Para traducir estas puntuaciones abstractas en porcentajes legibles que sumen exactamente **100%**, la red implementa la función matemática **Softmax**:

$$\sigma(\mathbf{z})_i = \frac{e^{z_i}}{\sum_{j=1}^{K} e^{z_j}}$$

* La función aplica un operador exponencial ($e^{z_i}$) a cada puntuación para asegurar que todos los valores sean estrictamente positivos.
* Luego, divide cada valor por la suma de todos los exponenciales ($\sum e^{z_j}$), convirtiendo los números en una distribución de probabilidad coherente.
* La probabilidad más alta indica la **emoción dominante** calculada por la IA.

---

## 📂 Estructura del Repositorio

La arquitectura del proyecto está optimizada para ser ligera, rápida y 100% libre de bases de datos persistentes:

```
computerV/
├── app/
│   ├── main.py                 # Servidor FastAPI con pipeline de inferencia DeepFace
│   └── templates/
│       ├── index.html          # Frontend premium en HTML5 con Canvas y webcam
│       └── style.css           # Estilos de alta gama (neón, vidrio esmerilado y animaciones)
├── requirements.txt            # Dependencias del proyecto de Python
└── start.sh                    # Script bash para instalación y arranque automático
```

---

## 🛠️ Instalación y Arranque Automático

Sigue estos sencillos pasos para instalar y poner en marcha **MoodMeter** en tu máquina local:

### 1. Navegar al Directorio del Proyecto
```bash
cd /Users/leonelmendiola/computerV
```

### 2. Arrancar la Aplicación
El sistema incluye un script automatizado `start.sh` que se encargará de crear el entorno virtual (`venv`), actualizar `pip`, instalar todas las dependencias y levantar el servidor FastAPI:
```bash
./start.sh
```

### 3. Abrir el Navegador
Una vez que el servidor reporte estar listo, abre tu navegador en:
👉 **[http://127.0.0.1:8000](http://127.0.0.1:8000)**

> 💡 **Nota de Primera Ejecución**: La primera vez que presiones "Escanear Rostro", DeepFace descargará automáticamente los pesos preentrenados del clasificador de emociones de Keras (~20MB). Este proceso se realiza una sola vez de forma interna y tardará solo unos segundos según tu velocidad de internet.

---

## 💻 Características del Dashboard

* **Captura Multidispositivo**: Si cuentas con cámara web activa, la rejilla láser cibernética escaneará tu rostro en vivo. Si no posees cámara web, haz clic en **Archivo** para subir cualquier fotografía local.
* **Mira Láser Flotante**: Al completar el escaneo, verás un recuadro cibernético dashed de color cian dibujado exactamente sobre las coordenadas físicas de tu rostro.
* **Gauges de Distribución**: Muestra barras neón de colores que representan el peso asignado por la red a cada emoción en tiempo real.
* **Mood Timeline (Línea de Tiempo)**: Un gráfico dinámico hecho con HTML5 Canvas que conecta los puntos de tus escaneos secuenciales. La curva cambia de color dinámicamente según la emoción dominante registrada en cada paso, ilustrando tu transición emocional (ej. de enojo a alegría).

---

## ⚡ Tecnologías Utilizadas
* **FastAPI** — API de alta velocidad en Python.
* **DeepFace** — Framework de análisis facial inmersivo.
* **OpenCV** — Localización y procesamiento espacial del rostro.
* **HTML5 / CSS3 / JavaScript (ES6)** — Frontend premium inmersivo sin dependencias pesadas.


---

## Instalación y ejecución para evaluación académica

### Requisitos previos

- Python 3.10 o 3.11 (se recomienda 3.11).
- Git instalado.
- Conexión a Internet para instalar dependencias y descargar los modelos de DeepFace.
- Navegador web actualizado.

### 1. Clonar el repositorio

```bash
git clone https://github.com/fernando2507063-lgtm/computerV.git
cd computerV
```

### 2. Crear el entorno virtual

```bash
python -m venv venv
```

### 3. Activar el entorno virtual

En Windows (PowerShell):

```powershell
.\venv\Scripts\Activate.ps1
```

En macOS o Linux:

```bash
source venv/bin/activate
```

### 4. Instalar las dependencias

```bash
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
```

### 5. Ejecutar MoodMeter

```bash
python -m uvicorn app.main:app --host 127.0.0.1 --port 8000
```

### 6. Abrir la aplicación

En el navegador ingresar a:

http://127.0.0.1:8000

### 7. Probar el funcionamiento

1. Permitir el acceso a la cámara o seleccionar una fotografía.
2. Capturar una imagen donde aparezca un rostro.
3. Ejecutar el análisis de emociones.
4. Revisar la emoción dominante y los porcentajes estimados.

Nota: Durante la primera ejecución, DeepFace puede
descargar modelos preentrenados automáticamente.

### 8. Detener el servidor

Presionar Ctrl+C en la terminal.

### Ejecución automática en macOS o Linux

También es posible utilizar el script incluido:

```bash
bash start.sh
```

Este script crea el entorno virtual si no existe,
instala las dependencias e inicia el servidor.

### Observaciones

- El proyecto utiliza FastAPI, DeepFace y OpenCV.
- Las dependencias se encuentran en requirements.txt.
- Los resultados son estimaciones de expresiones faciales,
  no diagnósticos del estado emocional de una persona.
- Se recomienda utilizar imágenes con buena iluminación.
```
