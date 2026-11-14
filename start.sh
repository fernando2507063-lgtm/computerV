
#!/bin/bash
set -e

# MoodMeter - Instalacion y arranque
cd "$(dirname "$0")"

echo "======================================"
echo "       INICIANDO MOODMETER"
echo "======================================"

# Crear entorno virtual si no existe
if [ ! -f "venv/bin/python" ]; then
    echo "Creando entorno virtual..."
    python3 -m venv venv
fi

# Instalar dependencias
echo "Instalando dependencias..."
venv/bin/python -m pip install --upgrade pip
venv/bin/python -m pip install -r requirements.txt

# Iniciar servidor
echo "======================================"
echo "Servidor: http://127.0.0.1:8000"
echo "Presiona Ctrl+C para detenerlo."
echo "======================================"

venv/bin/python -m uvicorn app.main:app \
    --host 127.0.0.1 \
    --port 8000
