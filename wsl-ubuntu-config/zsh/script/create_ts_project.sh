PROJECT_NAME=$1

mkdir $PROJECT_NAME
cd $PROJECT_NAME

yarn init -y
yarn add typescript ts-node nodemon rimraf @types/node --save-dev

npx tsc --init --rootDir src --outDir build \
--esModuleInterop --resolveJsonModule --lib es6 \
--module commonjs --allowJs true --noImplicitAny true

echo \
'{
    "watch": ["src"],
    "ext": ".ts,.js",
    "ignore": [],
    "exec": "ts-node ./src/index.ts"
}' > nodemon.json

sed -i '/"scripts"/a \ \ \ \ "start:dev": "nodemon", ' package.json
sed -i '/"scripts"/a \ \ \ \ "build": "rimraf ./build && tsc", ' package.json
sed -i '/"scripts"/a \ \ \ \ "start": "yarn run build && node build/index.js", ' package.json

mkdir src
touch src/index.ts

echo \
'node_modules
.npm
.env
build' > .gitignore
