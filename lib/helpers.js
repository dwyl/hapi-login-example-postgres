var validator = require('validator'); // github.com/chriso/validator.js

function validator_escape (str) {
  str = str || ''; // assign empty string if unset;
  return validator.escape(str);
}

/**
 * extract_validation_error does what its name suggests
 * given that the error is not in a very useable format we
 * need to extract it into a simple set of key:value pairs
 * @param {Object} error see: https://git.io/vcwiU
 * @returns {Object} err - the simplified error object
 */
function extract_validation_error(error) {
  // console.log('extract_validation_error', error.data.details[0]);
  var key = error.data.details[0].path;
  err = {}
  err[key] = {
    class   : 'input-error',                // css class
    message : error.data.details[0].message // Joi error message
  }
  return err;
}

/**
 * return_values extracts the values the person submitted if they
 * submitted the form with incomplete or invalid data so that
 * the form is not "wiped" each time it gets valdiated!
 * @param {Object} error - see: https://git.io/vciZd
 * @returns {Object} values - key:value pairs of the fields
 * with the value sent by the client.
 */
function return_form_input_values(error) {
  // var values;
  // if(error.data && error.data._object) { // see: https://git.io/vciZd
    var values = {};
    Object.keys(error.data._object).forEach(function(k){
      values[k] = validator.escape(error.data._object[k].toString());
    });
  // }
  return values;
}

module.exports = {
  extract_validation_error : extract_validation_error,
  return_form_input_values : return_form_input_values,
  escape : validator_escape
};
