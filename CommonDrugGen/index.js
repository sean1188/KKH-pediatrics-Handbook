var csv = require('csv-parser');
var fs = require('fs');

fs.createReadStream('CommonDrugList.csv')
  .pipe(csv())
  .on('data', processRow)
  .on('end', function() {
    fs.writeFile('CommonDrugs.json', JSON.stringify(drugs, null, 2));
  });

var drugs = {};
function processRow(data) {

  // Check whether drug exists
  if (drugs[data.DRUG]) {
    // Since it does, check whether route exists
    if (drugs[data.DRUG].routes[data.ROUTE]) {
      // Since it does, check whether method exists
      if (drugs[data.DRUG].routes[data.ROUTE].methods[data.METHOD]) {
        // Since method exists, crash with duplicate method error.
        console.log('ERROR: DUPLICATE METHOD FOUND');
        process.exit(2849687294);
      } else {
        // Since it doesn't exist, create the route and add method to it.
        drugs[data.DRUG].routes[data.ROUTE].methods[data.METHOD] = {
          name: data.METHOD
        };
        addData(data, drugs[data.DRUG].routes[data.ROUTE].methods[data.METHOD]);
      }
    } else {
      // Since it doesn't exist, create the route and add method to it.
      drugs[data.DRUG].routes[data.ROUTE] = {
        name: data.ROUTE,
        methods: {}
      };
      addMethod(data, drugs[data.DRUG].routes[data.ROUTE]);
    }
  } else {
    // Since it doesn't exist, create the drug and add everything to it.
    drugs[data.DRUG] = {
      name: data.DRUG,
      routes: {}
    };
    addRoute(data, drugs[data.DRUG]);
  }
}

function addRoute(data, drug) {
  drugs[data.DRUG].routes[data.ROUTE] = {
    name: data.ROUTE,
    methods: {}
  };
  addMethod(data, drugs[data.DRUG].routes[data.ROUTE]);
}

function addMethod(data, route) {
  drugs[data.DRUG].routes[data.ROUTE].methods[data.METHOD] = {
    name: data.METHOD
  };
  addData(data, drugs[data.DRUG].routes[data.ROUTE].methods[data.METHOD]);
}

function addData(data, method) {
  method.remarks = data.REMARKS;

  if (isNaN(method.DOSE)) {
    method.content = data.DOSEPERKG;
  } else {
    method.unit = data.UNIT;
    method.dose = data.DOSEPERKG;
  }
}
