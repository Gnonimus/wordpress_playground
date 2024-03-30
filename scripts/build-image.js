const {exec} = require('child_process');
const os = require('os');

const scriptPath = os.platform() === 'win32' ? './scripts/build-image.ps1' : './scripts/build-image.sh';

const printError = (msg) => {
    console.error(`\n${msg}\n`);
}

const command = `bash ${scriptPath}`
exec(command, (error, stdout, stderr) => {
    if (error) {
        printError(`Error executing the script: ${error.message}`);
        return;
    }

    console.log(`${stdout}`)

    if (stderr) {
        printError(`\nErrors executing the script: ${stderr}\n`);
    }
});
