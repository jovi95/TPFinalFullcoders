Algoritmo GestionCarga
    // Definición de variables
	Definir productos, productoBuscado, usuario, contrasena, usuarioIngresado, contrasenaIngresada Como Cadena;
	Definir precios Como Real;
	Definir tamanoInventario, OP, N, intentos Como Entero;
	Definir encontrado Como Logico;
	
    // Asignamos valores de usuario y contraseña
	usuario <- 'admin';
	contrasena <- '1234';
	
    // Número máximo de intentos para iniciar sesión
	intentos <- 3;
	//Inicializamos variables usuarioIngresado y contrasenaIngresada
	usuarioIngresado <- '';
	contrasenaIngresada <- '';
	//Mensaje de bienvenida al sistema
	Escribir 'Bienvenido al sistema de carga Celer para inventarios';
	
    // Inicio del ciclo para el inicio de sesión
	Mientras (intentos > 0) Y ((usuario <> usuarioIngresado) O (contrasena <> contrasenaIngresada)) = Verdadero Hacer
		Escribir 'Por favor, inicie sesión para continuar:';
		Escribir 'Usuario: ';
		Leer usuarioIngresado;
		Escribir 'Contraseña: ';
		Leer contrasenaIngresada;
		
        // Verificación de usuario y contraseña
		Si (usuarioIngresado = usuario) Y (contrasenaIngresada = contrasena) = Verdadero Entonces
			Limpiar Pantalla;
			Escribir 'Inicio de sesión exitoso.';
		SiNo
			Escribir 'Usuario o contraseña incorrectos. Intentos restantes: ', intentos - 1;
			intentos <- intentos - 1;
		FinSi
	FinMientras
	
    // Si se agotan los intentos, se muestra un mensaje y se sale del programa
	Si intentos = 0 Entonces
		Escribir 'Número máximo de intentos alcanzado. Saliendo del programa.';
	SiNo
        // Si se inicia sesión correctamente, se procede a cargar productos al inventario
		Escribir 'Ingrese la cantidad de productos a cargar: ';
		Leer tamanoInventario;
		Dimensionar productos(tamanoInventario);
		Dimensionar precios(tamanoInventario);
		
        // Ciclo para cargar los productos y sus precios
		Para N <- 1 Hasta tamanoInventario Con Paso 1 Hacer
			Escribir '';
			Escribir 'Ingrese el nombre del producto ', N, ': ';
			Leer productos[N];
			Escribir 'Ingrese el precio del producto ', N, ': ';
			Leer precios[N];
			Escribir '';
		FinPara
		
        // Mensaje para ingresar al menú principal
		Escribir 'Presione una tecla para ingresar al Menú';
		Esperar Tecla;
		
        // Inicio del menú principal
		Repetir
			Limpiar Pantalla;
			Escribir 'Escriba el número de la opción deseada';
			Escribir '1. Buscar un producto';
			Escribir '2. Listar todos los productos';
			Escribir '3. Salir';
			Escribir 'Elija una opción (1-3): ';
			Leer OP;
			
            // Opción 1: Buscar producto
			Si (OP = 1) Entonces
				Si tamanoInventario < 1 Entonces
					Escribir 'Inventario vacío, por favor, cargue algunos productos en el sistema antes de hacer su búsqueda';
				SiNo
					Escribir 'Ingrese el nombre del producto a buscar: ';
					Leer productoBuscado;
					encontrado <- Falso;
					
                    // Búsqueda del producto y su precio
					Para N <- 1 Hasta tamanoInventario Hacer
						Si productos[N] = productoBuscado Entonces
							Escribir 'Producto encontrado: ', productos[N];
							Escribir 'Precio: ', precios[N];
							encontrado <- Verdadero;
						FinSi
					FinPara
					
                    // Mensaje si el producto no se encuentra
					Si NO encontrado Entonces
						Escribir 'Producto no encontrado.';
					FinSi
				FinSi
			FinSi
			
            // Opción 2: Listar todos los productos
			Si (OP = 2) Entonces
				Escribir '';
				
                // Listar todos los productos y sus precios
				Para N <- 1 Hasta tamanoInventario Con Paso 1 Hacer
					Escribir 'Producto ', N, ' :', productos[N], ', Precio: ', precios[N];
				FinPara
			FinSi
			
            // Opción 3: Salir del programa
			Si (OP > 3) Entonces
				Escribir 'Opción no válida';
			FinSi
			
            // Mensaje para salir al menú principal
			Escribir 'Presione cualquier tecla para volver a intentar';
			Esperar Tecla;
			
			// Fin del menú principal (Repetir)
		Hasta Que OP = 3
		
        // Mensaje de salida del programa
		Escribir 'Saliendo del programa...';
	FinSi
FinAlgoritmo
