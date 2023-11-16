const path = require('path');
const CopyPlugin = require("copy-webpack-plugin");
const Dotenv = require('dotenv-webpack');

module.exports = {
    mode: 'development',
    entry: './index.js',
    output: {
        filename: 'main.js',
        path: path.resolve(__dirname, 'dist'),
    },
    devServer: {
        static: {
            directory: path.join(__dirname, './')
        },
    },
    plugins: [
        new CopyPlugin({
            patterns: [
                './index.html',
                './styles.css'
            ]
        }),
        new Dotenv()
    ]
};