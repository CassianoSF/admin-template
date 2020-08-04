const path = require('path');

module.exports = {
    module: {
        rules: [
            {
                test: /\.imba$/,
                loader: 'imba/loader',
            }
        ]
    },
    resolve: {
        extensions: [".imba", ".js", ".json"]
    },
    entry: "./src/app-root.imba",
    output: { path: __dirname + '/public', filename: "app.imba.js" }
}