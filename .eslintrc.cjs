module.exports = {
    env: {
        browser: true,
        es2021: true,
    },
    extends: 'standard-with-typescript',
    overrides: [
        {
            env: {
                node: true,
            },
            files: ['.eslintrc.{js,cjs}'],
            parserOptions: {
                sourceType: 'script',
            },
        },
    ],
    parserOptions: {
        ecmaVersion: 'latest',
        sourceType: 'module',
        project: ['./tsconfig.json'],
    },
    rules: {
        'no-sparse-arrays': 0,
        '@typescript-eslint/consistent-type-imports': 0,
    },
    ignorePatterns: ['src/vendor/*', 'node_modules', 'src/music.ts']
}
