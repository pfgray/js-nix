```mermaid
graph TD
A[pnpm] --> D[js-nix --generate-lock]
B[npm] --> D
C[yarn] --> D
D --> E[js-nix-lock.json]
```
