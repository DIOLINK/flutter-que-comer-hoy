# 🚀 Plan de Desarrollo: QueComemosHoy 🥑

¡Bienvenido al proyecto "QueComemosHoy"! Esta aplicación ayudará a los usuarios a planificar y preparar comidas saludables de una manera fácil y personalizada.

Este documento servirá como nuestra hoja de ruta. ¡Vamos a crear algo increíble juntos!

---

### **Fase 1: Cimientos del Proyecto** 🏗️
*   **Objetivo:** Configurar la estructura base del proyecto.
*   **Tareas:**
    1.  **Inicialización:** Limpiar el proyecto por defecto de Flutter.
    2.  **Dependencias:** Añadir paquetes esenciales a `pubspec.yaml` (`firebase_core`, `firebase_auth`, `cloud_firestore`, `google_sign_in`, etc.).
    3.  **Arquitectura:** Definir una estructura de carpetas clara (`lib/src`, `screens`, `widgets`, `services`, `models`) para mantener el código organizado.
    4.  **UI Principal:** Implementar el esqueleto de la app con la navegación básica (ej. `BottomNavigationBar`) y las pantallas principales (Inicio, Perfil, Plan).
    5.  **Estilo y Tema:** Crear un archivo de tema central (`theme.dart`) con la paleta de colores cálida y la tipografía definida.

### **Fase 2: Perfil de Usuario y Autenticación con Firebase** 👤
*   **Objetivo:** Permitir que los usuarios se registren y guarden sus preferencias.
*   **Tareas:**
    1.  **UI de Autenticación:** Diseñar y construir la pantalla de inicio de sesión con opciones para Google y Facebook.
    2.  **Lógica de Autenticación:** Implementar la lógica de negocio utilizando **Firebase Authentication**.
    3.  **Formulario de Perfil:** Construir la pantalla donde los usuarios ingresarán sus datos (alergias, preferencias alimentarias).
    4.  **Guardado de Datos:** Almacenar la información del perfil del usuario en **Cloud Firestore** (nuestra base de datos NoSQL para el MVP).

### **Fase 3: Motor de Sugerencias y Backend** 🧑‍🍳
*   **Objetivo:** Mostrar recetas sugeridas al usuario.
*   **Tareas:**
    1.  **Servicio de Backend:** Crear una clase de servicio (`RecipeService`) que se comunicará con el backend.
    2.  **Datos de Prueba (MVP):** Dentro del `RecipeService`, implementaremos una función que devuelva datos de recetas de ejemplo que imiten la estructura de la respuesta de la IA.
    3.  **Modelo de Datos:** Definir la clase `Recipe.dart` para modelar los datos de una receta.
    4.  **UI de Sugerencias:** Diseñar y construir el widget principal que muestra la tarjeta de la receta sugerida, basándonos en las maquetas proporcionadas.

> **Nota:** La app estará lista para reemplazar los datos de prueba con una llamada HTTP al endpoint del backend de IA cuando esté disponible.

### **Fase 4: Plan de Comidas y Personalización** 📝
*   **Objetivo:** Permitir al usuario personalizar y generar un plan de comidas.
*   **Tareas:**
    1.  **Formulario de Personalización:** Al tocar "Preparar", mostrar un formulario para ajustar detalles (ej. número de personas).
    2.  **Lógica de Generación:** Implementar la lógica que toma la receta y las personalizaciones para generar una lista de ingredientes y pasos.
    3.  **Vista del Plan:** Diseñar la pantalla que muestra el plan de comida semanal o diario.

### **Fase 5: Pulido e Integración Final** ✨
*   **Objetivo:** Refinar la aplicación y prepararla para el siguiente nivel.
*   **Tareas:**
    1.  **Integración del Backend:** Reemplazar los datos de prueba en el `RecipeService` con las llamadas reales al API del backend de IA.
    2.  **Mejoras Visuales:** Añadir animaciones y transiciones para una experiencia de usuario más fluida y agradable.
    3.  **Manejo de Errores:** Implementar mensajes de error claros para el usuario (ej. si falla la conexión a internet).
    4.  **Pruebas:** Escribir tests unitarios y de widgets para las funcionalidades clave.