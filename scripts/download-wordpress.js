const os = require('os');
const {execSync} = require('child_process');

const isWindows = os.platform() === 'win32';

if (isWindows) {
    execSync('npm run download-wordpress:win', {stdio: 'inherit'});
} else {
    execSync('npm run download-wordpress:unix', {stdio: 'inherit'});
}