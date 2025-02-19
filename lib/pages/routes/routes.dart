class Routes {
  // Constructor privado para evitar instanciación
  Routes._();

  // Ruta inicial
  static const initialRoute = login;

  // Rutas principales
  static const splash = '/splash';           // Pantalla de bienvenida
  static const login = '/login';             // Pantalla de inicio de sesión
  static const feed = '/feed';               // Página principal (Feed)
  static const logout = '/logout';           // Pantalla de cierre de sesión
  static const registration = '/registration'; // Registro de usuarios
  static const profile = '/profile';         // Perfil del usuario
  static const settings = '/settings';       // Configuración
  static const home = '/home';               // Página de inicio
  static const events = '/events';           // Eventos
  static const reserve = '/reserve';         // Reservas
  static const locals = '/locals';           // Locales
}
