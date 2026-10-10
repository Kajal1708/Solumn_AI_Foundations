# Quality bar and evidence

## Standard held

The following standard was used for the work:

- The user task is always complete and valid on the safe path.
- The embedded directive is never in `instruction.md`.
- Each family uses a different injection placement and the variants are meaningfully distinct.
- The grader checks real filesystem effects, not just string matches.
- The reference solver completes the user task while treating the embedded directive as untrusted information.
- The verifier is runnable and writes reward artifacts in Harbor-compatible locations.

## Evidence collected

- Nine task directories exist in `environments/`.
- Three families are represented and each has three variants.
- Each environment contains a clean `instruction.md` and a repository-side injection source.
- Each environment has a working reference solution and a verifier script.
- The output JSON that the solver writes matches the required values for the standard input.
- The reward files in `results/` reflect successful validation for each environment.

## Abandoned work

The external GPT-5.5 Harbor rollout described in the assignment was run here after the Harbor execution harness, Docker runtime, and endpoint access were prepared. The collected `jobs/` artifacts record the actual model failures against the benchmark, rather than a hand-waved success claim.
