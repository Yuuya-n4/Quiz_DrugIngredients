import esbuild from 'esbuild';
import babelPlugin from 'esbuild-plugin-babel';

esbuild.build({
  entryPoints: ['app/javascript/application.js'],
  bundle: true,
  sourcemap: true,
  outdir: 'app/assets/builds',
  publicPath: '/assets',
  plugins: [
    babelPlugin({
      config: {
        presets: ['@babel/preset-react']
      }
    })
  ]
}).catch(() => process.exit(1));