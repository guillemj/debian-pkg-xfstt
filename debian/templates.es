Template: xfstt/fonts_not_provided
Type: note
Description: Fonts not provided by this package
 It appears you have installed fonts in /var/ttfonts from a previous
 version of xfstt. This has been changed and xfstt now uses
 /usr/share/fonts/truetype. Please place any truetype fonts in that
 location.
Description-es: Fuentes no proveidas por este paquete 
 Parece que tiene fuentes instaladas en /var/ttfonts de una versión
 anterior de xfstt. Esto ha cambiado y xfstt ahora usa
 /usr/share/fonts/trutype. Por favor ponga cualquier fuente truetype
 en este directorio.

Template: xfstt/default_port_changed
Type: note
Description: Server port changed to 7101
 Due to a conflict with xfs (X Font Server), in version 0.99.10 the default
 port was changed. If you have X11 still configured to use port 7100 for
 xfstt, please modify your configuration to reflect this change. See
 xfstt(1) manual page.
Description-es: El puerto del servidor ha cambiado a 7101
 A causa de un conflicto con xfs (X Font Server), en la versión 0.99.10
 el puerto predeterminado ha cambiado. Si aun tiene X11 configurado
 para usar el puerto 7100 con xfstt, por favor modifique su configuración
 para reflejar este cambio. Vea la pagina de manual xfstt(1).

Template: xfstt/listen_tcp
Type: boolean
Default: false
Description: Do you want xfstt to listen on a TCP port?
 Xfstt runs as superuser, but only before a connection is stablished with
 the client, then it drops superuser privileges and is run as user nobody.
 .
 This approach is fairly secure, but if you are not going to provide fonts
 to other hosts, it is recommended to not listen on network connections.
Description-es: ¿Quiere que xfstt escuche en un puerto TCP? 
 Xfstt funciona como superusuario, pero solo antes de establecer una
 conexión con un cliente, después deja los privilegios de superusuario y
 funciona como usuario 'nobody'.
 .
 Esta aproximación es bastante segura, pero si no va a suministrar fuentes
 a otras anfitriones, se recomienda no escuchar en conexiones de red.
 
