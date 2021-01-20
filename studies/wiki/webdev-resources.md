# Web development resources

A list of things I always find myself wanting a link, but never know where the are:

- https://undraw.co/ - slick open source free illustrations for your project
- [Optimize webpack chunk splitting](#chunk-spliting)
- https://csswizardry.com/2020/11/site-speed-topography/ - how to analyze WebPageTest/lighthouse reports: TTFB, FP, FCP, SI, LCP, CLS, TBT
- https://github.com/petkaantonov/bluebird/wiki/Optimization-killers - optimization tricks for V8 (the js engine for chrome) [but it's deprecated]

<a name="chunk-spliting"></a>
## optimize webpack chunk splitting

Basically this makes everything into one file:

```js
const path = require('path');

module.exports = {
  entry: path.resolve(__dirname, 'src/index.js'),
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: '[name].[contenthash].js',
  },
};
```

This splits npm packages and your files into two:

```js
const path = require('path');

module.exports = {
  entry: path.resolve(__dirname, 'src/index.js'),
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: '[name].[contenthash].js',
  },
  optimization: {
    splitChunks: {
      chunks: 'all',
    },
  },
};
```

And this splits every package in it's own chunk:

```js
const path = require('path');
const webpack = require('webpack');

module.exports = {
  entry: path.resolve(__dirname, 'src/index.js'),
  plugins: [
    new webpack.HashedModuleIdsPlugin(), // so that file hashes don't change unexpectedly
  ],
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: '[name].[contenthash].js',
  },
  optimization: {
    runtimeChunk: 'single',
    splitChunks: {
      chunks: 'all',
      maxInitialRequests: Infinity,
      minSize: 0,
      cacheGroups: {
        vendor: {
          test: /[\\/]node_modules[\\/]/,
          name(module) {
            // get the name. E.g. node_modules/packageName/not/this/part.js
            // or node_modules/packageName
            const packageName = module.context.match(/[\\/]node_modules[\\/](.*?)([\\/]|$)/)[1];

            // npm package names are URL-safe, but some servers don't like @ symbols
            return `npm.${packageName.replace('@', '')}`;
          },
        },
      },
    },
  },
};
```

Reference:
- https://medium.com/hackernoon/the-100-correct-way-to-split-your-chunks-with-webpack-f8a9df5b7758
- https://webpack.js.org/guides/caching/
