import esbuild from 'esbuild';

esbuild.build({
  entryPoints: [
    'app/javascript/application.js',
    'app/javascript/top_page.js',
    'app/javascript/quiz_page.js',
    'app/javascript/quizlist_page.js',
    'app/javascript/header.js',
  ],
  bundle: true,
  sourcemap: true,
  outdir: 'public/assets',
  loader: {
    '.js': 'jsx',
  },
  publicPath: '/assets/builds',
}).catch(() => process.exit(1));
