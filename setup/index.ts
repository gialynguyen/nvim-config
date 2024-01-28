import { $ } from 'bun';

const CWD = (await $`echo "$HOME"`.text()).trim();

$.cwd(CWD)

await $`git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf`;
await $`~/.fzf/install`;
await $`cargo install fd-find`;
await $`cargo install git-delta`;
