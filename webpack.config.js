module.exports = {
  entry  : __dirname + "/app/assets/scripts/raeoks.jsmx",
  module : {
    loaders: [{
      test   : /\.(js|jsx|jsmx)$/,
      exclude: /(node_modules|bower_components)/,
      loader : "babel-loader"
    }, {
      test   : /\.(js|jsx|jsmx)$/,
      exclude: /(node_modules|bower_components)/,
      loader : "source-map-loader"
    }]
  },
  output : {
    path    : __dirname + "/app/sources/scripts",
    filename: "raeoks.js"
  },
  debug  : true,
  devtool: "source-map",
};
