const runSingleCommand = async (command) => {
    const spawn = require('child_process').spawn;
    const commandList = [
        command
    ].join(' && ');

    const runCommandList = new Promise((resolve, reject) => {
        let child = spawn(commandList, {
            shell: true
        });
        child.stderr.on('data', (data) => {
            console.error("STDERR:", data.toString());
            reject(false);
        });
        child.stdout.on('data', (data) => {
            console.log("STDOUT:", data.toString());
            resolve(true);
        });
        child.on('exit', (exitCode) => {
            console.log(`[${command.split('.')[1]}] Installed.`);
        });
    })

    const success = await runCommandList;
    return success;
}

const installVsCodeExtensions = (second) => {
    const lines = require('fs')
        .readFileSync('./vscode_instructions/vscode_instr.txt', 'utf-8')
        .split(/\r?\n/);

    for (let line of lines) {
        runSingleCommand(`code --install-extension ${line}`);
    }
}

installVsCodeExtensions();