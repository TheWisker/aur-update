<h1 align="center">AUR Update</h1>
<div align="center">
    <a href="https://github.com/TheWisker/aur-update">
        <img width="350" src="./assets/logo.svg">
    </a>
</div>
<p align="center">Updates AUR packages on release</p>

<h2 align="center">Index</h2>

<div align="center">
    
  [Description][description]
  
  [Usage][usage]

  [Discussions][discussions]

  [Support][support]

  [Contributions][contributions]
  
  [Code of Conduct][coc]
  
  [Author][author]

</div>

<h2 align="center">Description [<a href="https://github.com/TheWisker/aur-update#index">↑</a>]</h2>

<p align="center">This is a <b>Github Action</b> that updates AUR git packages on release.</p>

<h2 align="center">Usage [<a href="https://github.com/TheWisker/aur-update#index">↑</a>]</h2>

To use this **GitHub Action** you need to already have **initialized** the **AUR repository** and **uploaded** a first **version**.
The **pkgbase** must not end in `-git` for this action to work and to *differentiate* it from the *release* action which you can maintain with this action's twin [AUR Update Git][twin].

Once that has been taken care of, you need to create a **folder** in your GitHub **repository** were the AUR **packages** will be **stored** and **updated** (by default /aur). Inside said folder, you must **creat** a **folder** named exactly as the **pkgbase** for each package you intend to maintain. Then, *optionally*, **fill** each package's folder with it's AUR **content** (PKGBUILD .SRCINFO ...).

After all this preparations have been done it is only left to **create** the **workflow** `.yml` file under `.github/workflows/`.

The `.yml` file needs certain **fields** to have specific **values** to work. These are:

<h4 align="left"><b>Permissions</b> to <b>write</b> to the repo</h4>

```yaml
permissions:
  contents: write
```

<h4 align="left"><b>Run</b> the job on a <b>priviledged Arch</b> container</h4>

On the job element:

```yaml
runs-on: ubuntu-latest 
container:
  image: archlinux
  options: --privileged
```

<h4 align="left">Run on <b>release</b></h4>

```yaml
on:
  release:
    types: [published]
```

**Not** really **needed** but it is **intented** to work on release

<h3 align="center">Parameters</h3>

| Inputs | Default | Required | Description |
| ------ | ------- | -------- | ----------- |
| **aur_key** | no default | true | AUR **ssh** private **key** |
| **ref** | 'master' | false | Checkout **reference** |
| **username** | ${{ github.actor \|\| 'github-actions-bot'}} | false | Git **username** to use |
| **email** | 'github-actions-bot@noreply.com' | false | Git **email** to use |
| **repo** | ${{ github.repository }} | false | **Repository**: user/repo_name |
| **repo_name** | ${{ github.event.repository.name }} | false | Repository **name** |
| **aur_folder** | ./aur | false | AUR files **folder** |
| **tag_name** | ${{ github.event.release.tag_name \|\| 'no-tag' }} | false | Release **tag name** for commit messages |

<h3 align="center">Examples</h3>

<h4 align="left">Basic</h4>

```yaml
name: AUR Update
on:
  release:
    types: [published]
permissions:
  contents: write
jobs:
  aur-update-git:
    runs-on: ubuntu-latest 
    container:
      image: archlinux
      options: --privileged
    steps:
      - name: AUR Update
        uses: TheWisker/aur-update@master
        with:
          aur_key: ${{ secrets.AUR_KEY }}
```

The most **basic** workflow file

<h4 align="left">Advanced</h4>

```yaml
name: AUR Update
run-name: AUR package update by ${{ github.actor }} release
on:
  release:
    types: [published]
permissions:
  contents: write
concurrency:
  group: "aur"
  cancel-in-progress: true
jobs:
  aur-update-git:
    environment:
      name: aur-packages
    runs-on: ubuntu-latest 
    container:
      image: archlinux
      options: --privileged
    steps:
      - name: AUR Update
        uses: TheWisker/aur-update@master
        with:
          aur_key: ${{ secrets.AUR_KEY }}
          username: TheWisker
          email: TheWisker@protonmail.com
```

Specifies a **concurrency** group so if it is called multiple times at once it is **serialized**. It also specifies an **environment** to deploy to so you can, for example, add a **delay** to said environment so you can cancel the AUR **update** if there has been a mistake commit. The environment can also be used to only **allow access** to the AUR_KEY **secret** to it to minimize **security** risks.

<h2 align="center">Discussions [<a href="https://github.com/TheWisker/aur-update#index">↑</a>]</h2>

Feel free to give any **ideas** for future **improvements** [here][discussion-ideas] and
ask any **questions** you have [here][discussion-questions].

<h2 align="center">Support [<a href="https://github.com/TheWisker/aur-update#index">↑</a>]</h2>

If you have got any problems with the action please refer to the [SUPPORT.md][support] file.

<h2 align="center">Contributions [<a href="https://github.com/TheWisker/aur-update#index">↑</a>]</h2>

First and foremost, all contributions are welcome!
The **steps** involved when making a contribution are **explained** in the [CONTRIBUTING.md][contributing] file.
We look forward to your contributions!

- The **contributors** list is located [here][contributors].

<h2 align="center">Code of Conduct [<a href="https://github.com/TheWisker/aur-update#index">↑</a>]</h2>

<p align="center"> This project follows the <a href="./.github/CODE_OF_CONDUCT.md"><b>Contributor Covenant Code of Conduct</b></a>.</p>

<h2 align="center">Author [<a href="https://github.com/TheWisker/aur-update#index">↑</a>]</h2>
<div align="center">
    <a href="https://github.com/TheWisker">
        <img width="200" height="200" src="./assets/profile.png"></img>
    </a>
</div>
<h4 align="center">TheWisker</h4>

[description]: https://github.com/TheWisker/aur-update#description-
[usage]: https://github.com/TheWisker/aur-update#usage-
[discussions]: https://github.com/TheWisker/aur-update#discussions-
[support]: https://github.com/TheWisker/aur-update#support-
[contributions]: https://github.com/TheWisker/aur-update#contributions-
[coc]: https://github.com/TheWisker/aur-update#code-of-conduct-
[author]: https://github.com/TheWisker/aur-update#author-
[twin]: https://github.com/TheWisker/aur-update-git
[discussion-ideas]: https://github.com/TheWisker/aur-update/discussions/categories/ideas
[discussion-questions]: https://github.com/TheWisker/aur-update/discussions/categories/q-a
[support]: ./SUPPORT.md
[contributing]: ./CONTRIBUTING.md
[contributors]: ./CONTRIBUTORS.md