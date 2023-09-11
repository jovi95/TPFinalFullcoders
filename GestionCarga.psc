Algoritmo GestionCarga
    // Definici�n de variables
	Definir productos, productoBuscado, usuario, contrasena, usuarioIngresado, contrasenaIngresada Como Cadena;
	Definir precios Como Real;
	Definir tamanoInventario, OP, N, intentos Como Entero;
	Definir encontrado Como Logico;
	
    // Asignamos valores de usuario y contrase�a
	usuario <- 'admin';
	contrasena <- '1234';
	
    // N�mero m�ximo de intentos para iniciar sesi�n
	intentos <- 3;
	//Inicializamos variables usuarioIngresado y contrasenaIngresada
	usuarioIngresado <- '';
	contrasenaIngresada <- '';
	//Mensaje de bienvenida al sistema
	Escribir 'Bienvenido al sistema de carga Celer para inventarios';
	
    // Inicio del ciclo para el inicio de sesi�n
	Mientras (intentos > 0) Y ((usuario <> usuarioIngresado) O (contrasena <> contrasenaIngresada)) = Verdadero Hacer
		Escribir 'Por favor, inicie sesi�n para continuar:';
		Escribir 'Usuario: ';
		Leer usuarioIngresado;
		Escribir 'Contrase�a: ';
		Leer contrasenaIngresada;
		
        // Verificaci�n de usuario y contrase�a
		Si (usuarioIngresado = usuario) Y (contrasenaIngresada = contrasena) = Verdadero Entonces
			Limpiar Pantalla;
			Escribir 'Inicio de sesi�n exitoso.';
		SiNo
			Escribir 'Usuario o contrase�a incorrectos. Intentos restantes: ', intentos - 1;
			intentos <- intentos - 1;
		FinSi
	FinMientras
	
    // Si se agotan los intentos, se muestra un mensaje y se sale del programa
	Si intentos = 0 Entonces
		Escribir 'N�mero m�ximo de intentos alcanzado. Saliendo del programa.';
	SiNo
        // Si se inicia sesi�n correctamente, se procede a cargar productos al inventario
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
		
        // Mensaje para ingresar al men� principal
		Escribir 'Presione una tecla para ingresar al Men�';
		Esperar Tecla;
		
        // Inicio del men� principal
		Repetir
			Limpiar Pantalla;
			Escribir 'Escriba el n�mero de la opci�n deseada';
			Escribir '1. Buscar un producto';
			Escribir '2. Listar todos los productos';
			Escribir '3. Salir';
			Escribir 'Elija una opci�n (1-3): ';
			Leer OP;
			
            // Opci�n 1: Buscar producto
			Si (OP = 1) Entonces
				Si tamanoInventario < 1 Entonces
					Escribir 'Inventario vac�o, por favor, cargue algunos productos en el sistema antes de hacer su b�squeda';
				SiNo
					Escribir 'Ingrese el nombre del producto a buscar: ';
					Leer productoBuscado;
					encontrado <- Falso;
					
                    // B�squeda del producto y su precio
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
			
            // Opci�n 2: Listar todos los productos
			Si (OP = 2) Entonces
				Escribir '';
				
                // Listar todos los productos y sus precios
				Para N <- 1 Hasta tamanoInventario Con Paso 1 Hacer
					Escribir 'Producto ', N, ' :', productos[N], ', Precio: ', precios[N];
				FinPara
			FinSi
			
            // Opci�n 3: Salir del programa
			Si (OP > 3) Entonces
				Escribir 'Opci�n no v�lida';
			FinSi
			
            // Mensaje para salir al men� principal
			Escribir 'Presione cualquier tecla para volver a intentar';
			Esperar Tecla;
			
			// Fin del men� principal (Repetir)
		Hasta Que OP = 3
		
        // Mensaje de salida del programa
		Escribir 'Saliendo del programa...';
	FinSi
FinAlgoritmo
