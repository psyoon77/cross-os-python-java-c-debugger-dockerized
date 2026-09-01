<div align="center">

# 💻 Cross-OS Python, Java & C Programming Platform 💻

### Dockerized Beginner Development Environment for VS Code

<p>
  <img alt="Audience: beginners" src="https://img.shields.io/badge/audience-beginners-6f42c1">
  <img alt="Python: 3.11" src="https://img.shields.io/badge/Python-3.11-3776AB">
  <img alt="Java: 21" src="https://img.shields.io/badge/Java-21-ED8B00">
  <img alt="C: GCC and GDB" src="https://img.shields.io/badge/C-GCC%20%2B%20GDB-A8B9CC">
  <img alt="License: MIT" src="https://img.shields.io/badge/license-MIT-2ea44f">
</p>

<p>
  <a href="#-why-this-exists">Why this exists</a> •
  <a href="#-capabilities">Capabilities</a> •
  <a href="#-verified-on-apple-silicon-macos">Verified on Mac</a> •
  <a href="#-quick-start">Quick start</a> •
  <a href="#-run-the-examples">Examples</a> •
  <a href="#-debug-with-vs-code">Debugging</a> •
  <a href="#-references">References</a>
</p>

</div>

This repository includes just the skeleton of the prior work.

Environment setup is often one of the hardest parts of learning to code. This
repository gives beginners on macOS, Windows, and Linux a prepared Ubuntu
development container for practicing Python, Java, and C with the same tools,
commands, and VS Code debugging workflow.

## 🎯 Why this exists

The goal is to let a new programmer spend less time installing compilers and
more time writing, running, and debugging code. The host operating systems do
not run identical native toolchains; instead, each host opens the same Linux
container through Docker and [VS Code Dev Containers](https://code.visualstudio.com/docs/devcontainers/create-dev-container).

This makes the project useful as a beginner coding environment, programming
classroom starter, reproducible development environment, or cross-platform
Python, Java, and C debugging workspace.

## 📋 Capabilities

| Area | Included |
| --- | --- |
| Host workflows | macOS, Windows, or Linux with Docker; GitHub Codespaces is also supported |
| Container | Ubuntu 24.04 development environment with `amd64` and `arm64` Miniforge support |
| Python | Python 3.11, `pip`, debugpy, and the VS Code Python and Jupyter extensions |
| Java | OpenJDK 21 and the VS Code Extension Pack for Java |
| C and C++ | GCC, G++, GDB, Make, CMake, Ninja, and Microsoft C/C++ extensions |
| Editor workflow | VS Code IntelliSense, integrated terminal, breakpoints, variable inspection, and step debugging |
| Developer tools | Git, Git LFS, GitHub CLI, SSH client, `curl`, `wget`, Vim, Nano, and tmux |
| Containers | Docker Compose development service with an Ollama sidecar and persistent model volume |
| Collaboration | Microsoft Live Share extension is preinstalled in the development container |

“Cross-OS” means that supported host systems enter a shared Linux development
environment. It does not mean that every checked-in artifact is a native binary
for every operating system. Compile the provided source inside the container.

## ✅ Verified on Apple Silicon macOS

A fresh public clone was tested end to end on September 1, 2026, using an
Apple Silicon M2 Mac, Docker Desktop 29.7.2, desktop VS Code, and the Dev
Containers extension. The repository opened successfully at `/workspace` in
the development container.

The container reported Python 3.11.16, Java 21.0.10, GCC 16.2.0, GDB 17.2,
and CMake 4.4.3. The included Python, Java, and C examples ran successfully,
the CMake build completed, and the VS Code Python, Java, and C debugger
workflows all completed successfully.

The test used the public repository exactly as documented below. No Ollama
model was downloaded or required for the core programming and debugging
workflow.

## 🚀 Quick start

### 1. Install the host applications

Install:

- [Git](https://git-scm.com/downloads)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Docker Desktop](https://docs.docker.com/desktop/) on macOS or Windows, or a
  compatible Docker Engine and Compose installation on Linux
- Microsoft’s [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

Start Docker before opening the container.

### 2. Clone and open the project

```bash
git clone https://github.com/psyoon77/cross-os-python-java-c-debugger-dockerized.git
cd cross-os-python-java-c-debugger-dockerized
```

Open VS Code, select **File → Open Folder**, and choose the cloned
`cross-os-python-java-c-debugger-dockerized` folder. If you have installed the
optional `code` shell command, you can open it from the terminal with `code .`.

### 3. Reopen it inside the container

In VS Code:

1. Open the Command Palette with `Command+Shift+P` on macOS or
   `Ctrl+Shift+P` on Windows and Linux.
2. Select **Dev Containers: Reopen in Container**.
3. Wait for the image, Conda environment, and editor extensions to finish.
4. Open a VS Code terminal and verify the toolchain:

```bash
python --version
javac -version
gcc --version
gdb --version
cmake --version
```

VS Code is the editor. Dev Containers opens the repository inside the prepared
Linux container, so Python, Java, C, the compiler, and the debugger come from
the container instead of being installed separately on every host.

### Terminal-only Docker Compose option

From the repository root:

```bash
docker compose up -d --build
docker compose exec cs-project-docker bash
```

Leave the shell with `exit`, then stop the project with:

```bash
docker compose down
```

The standard Compose and Dev Container workflow starts the Ollama sidecar
defined by this repository, although it does not download a model until you
request one. To use only the verified Python, Java, C, and CMake environment
without starting Ollama, run:

```bash
docker compose build cs-project-docker
docker compose run --rm --no-deps cs-project-docker bash
```

Leave that temporary shell with `exit`. The `--no-deps` option is important:
it prevents Compose from starting the Ollama dependency.

## ▶ Run the examples

Run these commands inside the development container.

### Python

```bash
python python/hello-world-for.py
```

### Java

```bash
javac -d java-out java/HelloWorldFor.java
java -cp java-out HelloWorldFor
```

### C

```bash
mkdir -p c/c-executables
gcc -O0 -g c/hello-world-for.c -o c/c-executables/hello-world-for
./c/c-executables/hello-world-for
```

You can also build the C example with CMake:

```bash
cmake -S . -B build
cmake --build build
./build/c/hello_world_for
```

## 🐞 Debug with VS Code

The development container automatically installs the relevant Microsoft editor
extensions.

### Python debugging

1. Open `python/hello-world-for.py`.
2. Select the interpreter shown in the VS Code status bar. If VS Code initially
   chooses `/usr/bin/python3`, change it to
   `/opt/conda/envs/cs-project-docker/bin/python` so debugging uses the same
   Python 3.11 environment as the terminal.
3. Add a breakpoint by clicking beside a line number.
4. Use the Run button menu and select **Python Debugger: Debug Python File**.

See the official [Python debugging guide](https://code.visualstudio.com/docs/python/debugging).

### Java debugging

1. Open `java/HelloWorldFor.java`.
2. Add a breakpoint.
3. Wait until the status bar says **Java: Ready**. If Java opens in Lightweight
   Mode, select that status item and switch to Standard Mode first.
4. Select **Debug** above the `main` method, or use **Run or Debug → Debug
   Java**.

See the official [Java debugging guide](https://code.visualstudio.com/docs/java/java-debugging).

### C debugging

1. Open `c/hello-world-for.c`.
2. Compile with `-g` using the command above.
3. Add a breakpoint.
4. Open **Run and Debug** and choose the C/C++ GDB workflow when prompted.

The tested choice was **C/C++: gcc build and debug active file**. GDB may print
`Failed to set controlling terminal: Operation not permitted` in a container;
the tested debugger still ran the program and completed normally.

The container enables `SYS_PTRACE` and relaxes its seccomp profile for GDB.
Use this development environment only with code you trust. See the official
[C/C++ debugging guide](https://code.visualstudio.com/docs/cpp/cpp-debug).

## ☁ GitHub Codespaces option

Users with access to the repository can also select **Code → Codespaces →
Create codespace on main** on GitHub. The `.devcontainer/devcontainer.json`,
Dockerfile, and Compose file define the remote environment. A codespace can be
used in browser-based VS Code or opened in desktop VS Code.

GitHub Codespaces can consume metered compute and storage. Review the official
[Codespaces billing documentation](https://docs.github.com/en/billing/concepts/product-billing/github-codespaces)
before creating or leaving a codespace running.

## 🤖 Optional local AI example

`ai/chat-ollama-openai.py` is a small experimental client for an
OpenAI-compatible Ollama endpoint. It is not a one-command beginner example in
the current preserved configuration: it expects an Ollama endpoint at
`localhost:11434` and the `llama3.2:1b` model, while Compose runs Ollama as a
separate service. Additional endpoint and model setup is required. See Ollama’s
[OpenAI compatibility](https://docs.ollama.com/api/openai-compatibility) and
[Docker](https://docs.ollama.com/docker) documentation.

Ollama is optional. The verified no-AI command above lets beginners learn and
debug all three programming languages without starting the Ollama service.

## 📖 Preserved manual

The repository’s previous README is preserved byte-for-byte as
[`manual.txt`](manual.txt). Additional historical onboarding notes are under
`manuals/`.

These legacy notes may contain old repository names, account references, and
host-wide Docker cleanup commands. Review them before use. Never share
passwords, API keys, private SSH keys, access codes, or unattended remote-control
credentials. The quick start above is the supported beginner path.

## 📚 References

- [VS Code Dev Containers](https://code.visualstudio.com/docs/devcontainers/create-dev-container)
- [Docker Compose](https://docs.docker.com/compose/)
- [GitHub Codespaces development containers](https://docs.github.com/en/codespaces/setting-up-your-project-for-codespaces/adding-a-dev-container-configuration/introduction-to-dev-containers)
- [Python in VS Code](https://code.visualstudio.com/docs/languages/python)
- [Java in VS Code](https://code.visualstudio.com/docs/languages/java)
- [C/C++ debugging in VS Code](https://code.visualstudio.com/docs/cpp/cpp-debug)
- [Conda environment management](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)
- [MIT License](https://opensource.org/license/mit)

## ⚖ License and attribution

Released under the [MIT License](LICENSE). Third-party products, services,
extensions, and trademarks remain subject to their respective licenses and
terms. This is an independent learning project and is not affiliated with the
vendors referenced above.

Release note: AI-assisted tools were used to help review and prepare the release
documentation. The repository owner reviewed the released material and remains
responsible for its contents.

---

<div align="center">
  <sub>A reproducible first workspace for learning Python, Java, C, containers, and debugging.</sub>
</div>
