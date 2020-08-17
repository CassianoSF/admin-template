const webpack = require('@cypress/webpack-preprocessor')

module.exports = (on) => {
    on('file:preprocessor', webpack({
        webpackOptions: {
            module: {
                rules: [{
                    test: /\.imba$/,
                    loader: 'imba/loader',
                }]
            },
            resolve: {
                extensions: [".imba",".js", ".json"]
            },
        },
        watchOptions: {},
    }))
}