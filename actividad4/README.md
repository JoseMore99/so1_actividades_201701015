# 1.Habilitar y arrancar el servicio

Ejecuta los siguientes comandos para habilitar y arrancar el servicio:

```bash
Copy code
sudo systemctl daemon-reload
sudo systemctl enable print-date.service
sudo systemctl start print-date.service 
```

# 2. Verificar el estado del servicio

Puedes verificar el estado del servicio con el siguiente comando:

```bash
Copy code
sudo systemctl status print-date.service
```
# 3. Ver la salida del servicio
Si deseas ver la salida generada por el script en tiempo real, puedes usar el siguiente comando:

```bash
Copy code
sudo journalctl -u print-date.service -f
```
Esto mostrará la salida del servicio en tiempo real.