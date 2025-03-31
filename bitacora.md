# Bitácora

# 4/12/25
    - Se añadió nodo de piso del tipo StaticBody3D.

# 5/12/25
    - Se añadieron texturas de colores para hacer debug.
    - Se añadió escena de proyectil.
    - Se añade colisión con el escenario para devolver a la posición inicial posterior a salir de esta.
    - Se añade la escena a la escena principal.
    - Se añaden proyecciones XY y XZ al proyectil

# 11/03/25
    - Se actualiza de la versión 4.3 a 4.4 de Godot

# 19/03/25
    - Se desactivan las sombras de la pared y piso del escenario parabola.

# 20/03/25
    - Se añaden ejes para ver el ángulo de lanzamiento.

# 21/03/25
    - Se añade pivote para la ver la dirección de lanzamiento del proyectil. 
    - Se añaden controles con teclado para el lanzamiento del proyectil.
    - El proyectil sigue correctamente la dirección de lanzamiento.

# 19/03/25
    - Reunión con profesor Ignacio Bordeu
        + Se decidió usar grupos pequeños para evaluar el funcionamiento de la aplicación.
        + Se decide tener la escena de proyectil y el problema del "cazador y el mono" para el axuliar del miércoles.
        + Se decide hablar con los auxiliares previo al auxiliar del día míércoles para coordinar todo.

# 23/03/25
    - Se modificaron los scripts para seguir la style guide de GDScript.
    - Los nodos ahora se obtienen con variables export, no con los métodos get child/parent.
    - Los nodos de proyección ahora son escenas propias.
    - Ahora el proyectil es lanzado con una señal en vez de una función.
    - Se añadió el addon XR tools de Godot.
    - Se añadieron manos al jugador.
    - Se añadió locomoción de teletransportación.

# 24/03/25
    - Se cambió el método de renderizado a "Compatibilty".
    - Se añadió el plugin "OpenXR Vendors" para poder exportar a cascos VR.
    - Se configuraron las herramientas para exportar a Android.
    - Se configuró el preset para exportar a Quest.
    - Se creó una escena de botón físico con señales.
    - Se añadieron manos físicas al jugador.
    - Se creó controlador para manipular escena de parábola.
    - Se ajustó la rápidez angular del pivote.
    - Se cambió el método de renderizado a "Mobile".
    - Se añadió giro al movimiento.

# 25/03/25
    - Se cambió el nombre de las carpetas a minúsculas.
    - Se añadio escena de escenario con colisión y mesh.
    - Se añadió el controlador a la escena de parábola.
    - Se simplificó la implementación de la escena Button

# 29/3/25
    - La proyección de proyectil ahora usa ENUM en vez de String para sus modos.
    - La escena "Scenery" ahora tiene variables exportadas de ancho, alto y profundidad.
    - Se añadió script que cambia el tamaño de la colisión, mesh y sus texturas al cambiar el valor de las variables.

# 30/3/25
    - Se cambió el nombre de la variable floor para no chocar con la función llamada floor()
    - Se cambió el nombre del paquete y se activó hand tracking.
    - Se añadió archivo md con links a assets.
    - Se cambiaron las texturas del piso.
    - Se añadio locomoción continua a control izquierdo.
    - Se añadió borders a el área de juego.
    - Se actualizó el UID de las manos físicas para evitar warnings.
    - Se añadió una palanca suave y función para agarrar objetos a manos.
    - Se cambió el nombre de las capas de colisión para tener mejor control sobre ellas.
    
