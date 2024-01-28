import { $ } from 'bun';

const CWD = (await $`echo "$HOME"`.text()).trim();
await $`git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf`.cwd(CWD);
await $`~/.fzf/install`.cwd(CWD);
await $`cargo install fd-find`.cwd(CWD);
await $`cargo install git-delta`.cwd(CWD);
await $`cargo install --locked --all-features --git https://github.com/ms-jpq/sad --branch senpai`.cwd(CWD)
