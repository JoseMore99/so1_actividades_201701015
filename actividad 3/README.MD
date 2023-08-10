## Parte1:
# Creación de usuarios y contraseñas:
jose@moreirapc:~$ sudo adduser usuario1
[sudo] password for jose:
Adding user `usuario1' ...
Adding new group `usuario1' (1001) ...
Adding new user `usuario1' (1001) with group `usuario1' ...
Creating home directory `/home/usuario1' ...
Copying files from `/etc/skel' ...
New password:
Retype new password:
passwd: password updated successfully
Changing the user information for usuario1
Enter the new value, or press ENTER for the default
        Full Name []: usuario1
        Room Number []: 1
        Work Phone []: 23
        Home Phone []: 45
        Other []:
Is the information correct? [Y/n] y
jose@moreirapc:~$ sudo adduser usuario2
Adding user `usuario2' ...
Adding new group `usuario2' (1002) ...
Adding new user `usuario2' (1002) with group `usuario2' ...
Creating home directory `/home/usuario2' ...
Copying files from `/etc/skel' ...
New password:
Retype new password:
passwd: password updated successfully
Changing the user information for usuario2
Enter the new value, or press ENTER for the default
        Full Name []: 2
        Room Number []: 34
        Work Phone []: 56
        Home Phone []: 78
        Other []:
Is the information correct? [Y/n] y
jose@moreirapc:~$ sudo adduser usuario3
Adding user `usuario3' ...
Adding new group `usuario3' (1003) ...
Adding new user `usuario3' (1003) with group `usuario3' ...
Creating home directory `/home/usuario3' ...
Copying files from `/etc/skel' ...
New password:
Retype new password:
passwd: password updated successfully
Changing the user information for usuario3
Enter the new value, or press ENTER for the default
        Full Name []:
        Room Number []: 2
        Work Phone []: 5
        Home Phone []: 9
        Other []:
Is the information correct? [Y/n] y
# Mostrar info fe los usuarios con el comando id
id usuario1
uid=1001(usuario1) gid=1001(usuario1) groups=1001(usuario1)
# Eliminar usuario 3
sudo userdel usuario3
## Parte 2:
# Creación de grupos: 
groupadd grupo1
groupadd: Permission denied.
groupadd: cannot lock /etc/group; try again later.
jose@moreirapc:~$ sudo groupadd grupo1
jose@moreirapc:~$ sudo groupadd grupo2
# Agregar usuarios a grupos: 
jose@moreirapc:~$ sudo usermod -aG grupo1 usuario1
jose@moreirapc:~$ sudo usermod -aG grupo2 usuario2
# Verificar grupos de usuarios
jose@moreirapc:~$ groups usuario1
usuario1 : usuario1 grupo1
jose@moreirapc:~$ groups usuario2
usuario2 : usuario2 grupo2
# eliminar grupo 2:
jose@moreirapc:~$ sudo groupdel grupo2
## Parte 3:
sudo su usuario1
usuario1@moreirapc:/$ cd home
usuario1@moreirapc:/home$ ls
jose  usuario1  usuario2  usuario3
usuario1@moreirapc:/home$ cd usuario1
usuario1@moreirapc:~$
# Creación de archivos y directorios:
usuario1@moreirapc:~$ echo "Jose Carlos Moreira Paz" > archivo1.txt
usuario1@moreirapc:~$ mkdir directorio1
usuario1@moreirapc:~$ echo "texto añadido" > directorio1/archivo2.txt
# Verificar permisos de atrchivo y directorio:
ls -l archivo1.txt
-rw-rw-r-- 1 usuario1 usuario1 24 Aug  9 18:19 archivo1.txt
usuario1@moreirapc:~$ ls -ld directorio1
drwxrwxr-x 2 usuario1 usuario1 4096 Aug  9 18:20 directorio1
# Modificar permisos usando chmod
chmod 640 archivo1.txt
usuario1@moreirapc:~$ chmod u+x directorio1/archivo2.txt
# Cambiar el Grupo Propietario:
chown :grupo1 directorio1/archivo2.txt
# Configurar permisos para el directorio
chmod 750 directorio1
# Comprobación de Acceso
usuario2@moreirapc:/home/usuario1$ cat archivo1.txt
cat: archivo1.txt: Permission denied
usuario2@moreirapc:/home/usuario1$ cat directorio1/archivo2.txt
cat: directorio1/archivo2.txt: Permission denied
# Verificación final
usuario1@moreirapc:~$ ls -l archivo1.txt
-rw-r----- 1 usuario1 usuario1 24 Aug  9 18:19 archivo1.txt
usuario1@moreirapc:~$ ls -l directorio1/archivo2.txt
-rwxrw-r-- 1 usuario1 grupo1 27 Aug  9 18:20 directorio1/archivo2.txt
usuario1@moreirapc:~$ ls -ld directorio1
drwxr-x--- 2 usuario1 usuario1 4096 Aug  9 18:20 directorio1
usuario1@moreirapc:~$
