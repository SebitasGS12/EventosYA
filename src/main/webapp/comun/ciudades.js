
function cargarCiudades() {
  var selectPaises = document.getElementById("selectPaises");
  var selectCiudades = document.getElementById("selectCiudades");
  var selectedPais = selectPaises.value;

  // Limpia las opciones del segundo elemento selectCiudades
  while (selectCiudades.firstChild) {
    selectCiudades.removeChild(selectCiudades.firstChild);
  }

  // Carga las opciones en el segundo elemento selectCiudades según la selección del primer elemento
  if (selectedPais === "1") {
    // Carga las opciones para Canadá
    var ciudadesCanada = ["Toronto", "Montreal", "Vancouver", "Calgary", "Edmonton", "Ottawa", "Winnipeg", "Quebec", "Hamilton", "Halifax"];
    for (var i = 0; i < ciudadesCanada.length; i++) {
      var option = document.createElement("option");
      option.value = ciudadesCanada[i];
      option.text = ciudadesCanada[i];
      selectCiudades.appendChild(option);
    }
  } else if (selectedPais === "2") {
    // Carga las opciones para Estados Unidos
    var ciudadesUSA = ["Nueva York", "Los Ángeles", "Chicago", "Houston", "Phoenix", "San Antonio", "San Diego", "Dallas", "San Francisco", "Miami"];
    for (var j = 0; j < ciudadesUSA.length; j++) {
      var option = document.createElement("option");
      option.value = ciudadesUSA[j];
      option.text = ciudadesUSA[j];
      selectCiudades.appendChild(option);
    }
  } else if (selectedPais === "3") {
    // Carga las opciones para México
    var ciudadesMexico = ["Ciudad de México", "Guadalajara", "Monterrey", "Puebla", "Tijuana", "León", "Juárez", "Zapopan", "Mérida", "Querétaro"];
    for (var k = 0; k < ciudadesMexico.length; k++) {
      var option = document.createElement("option");
      option.value = ciudadesMexico[k];
      option.text = ciudadesMexico[k];
      selectCiudades.appendChild(option);
    }
  } else if (selectedPais === "4") {
    // Carga las opciones para Argentina
    var ciudadesArgentina = ["Buenos Aires", "Córdoba", "Rosario", "Mendoza", "San Miguel de Tucumán", "La Plata", "Mar del Plata", "Salta", "Santa Fe", "Corrientes"];
    for (var l = 0; l < ciudadesArgentina.length; l++) {
      var option = document.createElement("option");
      option.value = ciudadesArgentina[l];
      option.text = ciudadesArgentina[l];
      selectCiudades.appendChild(option);
    }
  } else if (selectedPais === "5") {
    // Carga las opciones para Brasil
    var ciudadesBrasil = ["São Paulo", "Rio de Janeiro", "Brasilia", "Salvador", "Fortaleza", "Belo Horizonte", "Manaus", "Curitiba", "Recife", "Porto Alegre"];
    for (var m = 0; m < ciudadesBrasil.length; m++) {
      var option = document.createElement("option");
      option.value = ciudadesBrasil[m];
      option.text = ciudadesBrasil[m];
      selectCiudades.appendChild(option);
    }
  } else if (selectedPais === "6") {
    // Carga las opciones para Colombia
    var ciudadesColombia = ["Bogotá", "Medellín", "Cali", "Barranquilla", "Cartagena", "Cúcuta", "Bucaramanga", "Pereira", "Santa Marta", "Manizales"];
    for (var n = 0; n < ciudadesColombia.length; n++) {
      var option = document.createElement("option");
      option.value = ciudadesColombia[n];
      option.text = ciudadesColombia[n];
      selectCiudades.appendChild(option);
    }
  } else if (selectedPais === "7") {
    // Carga las opciones para Perú
    var ciudadesPeru = ["Lima", "Arequipa", "Trujillo", "Chiclayo", "Piura", "Cusco", "Iquitos", "Huancayo", "Tacna", "Chimbote"];
    for (var o = 0; o < ciudadesPeru.length; o++) {
      var option = document.createElement("option");
      option.value = ciudadesPeru[o];
      option.text = ciudadesPeru[o];
      selectCiudades.appendChild(option);
    }
  } else if (selectedPais === "8") {
    // Carga las opciones para Chile
    var ciudadesChile = ["Santiago", "Valparaíso", "Concepción", "La Serena", "Antofagasta", "Temuco", "Rancagua", "Arica", "Talca", "Viña del Mar"];
    for (var p = 0; p < ciudadesChile.length; p++) {
      var option = document.createElement("option");
      option.value = ciudadesChile[p];
      option.text = ciudadesChile[p];
      selectCiudades.appendChild(option);
    }
  } else if (selectedPais === "9") {
    // Carga las opciones para Ecuador
    var ciudadesEcuador = ["Guayaquil", "Quito", "Cuenca", "Santo Domingo", "Machala", "Durán", "Manta", "Portoviejo", "Ambato", "Loja"];
    for (var q = 0; q < ciudadesEcuador.length; q++) {
      var option = document.createElement("option");
      option.value = ciudadesEcuador[q];
      option.text = ciudadesEcuador[q];
      selectCiudades.appendChild(option);
    }
  } else if (selectedPais === "10") {
    // Carga las opciones para Venezuela
    var ciudadesVenezuela = ["Caracas", "Maracaibo", "Valencia", "Barquisimeto", "Maracay", "Ciudad Guayana", "Barcelona", "Maturín", "San Cristóbal", "Cumana"];
    for (var r = 0; r < ciudadesVenezuela.length; r++) {
      var option = document.createElement("option");
      option.value = ciudadesVenezuela[r];
      option.text = ciudadesVenezuela[r];
      selectCiudades.appendChild(option);
    }
  }
}