# Academic Paper-Writing Skills

A bundle of four complementary skills for the full paper-writing pipeline of Operations Research, ML+OR, and Supply Chain research — from reviewing experimental results for scientific merit, to polishing LaTeX prose, to auditing terminology, to responding to reviewers.

## Skills and Their Boundaries

Each skill owns one review dimension; together they cover what a top-journal reviewer (or copy editor) would flag. Skill names are ASCII kebab-case (required for slash commands); the Chinese aliases live in each skill's description, so saying "科学审稿 / 润色 / 黑话检查 / 审稿回复" in conversation triggers the right one without a slash command:

| Skill | 中文别名 | Dimension | What it checks |
|-------|---------|-----------|----------------|
| **scientific-review** | 科学审稿 | Scientific merit | Model validity, algorithmic contribution, experimental rigor, domain-specific conventions (VSS, EVPI, convergence...) |
| **language-polish** | 语言润色 | Text quality | Grammar, word choice, sentence structure, logic flow, academic tone — while preserving all LaTeX markup |
| **jargon-check** | 黑话检查 | Terminology & register | Tool-introduced shorthand, buzzwords, wording that drifts from the paper's own terminology or academic register |
| **rebuttal** | 审稿回复 | Revision execution | Point-by-point reviewer comment processing: propose changes, apply markup edits, compile PDFs, update the response letter |

The split is deliberate: `scientific-review` does **not** judge prose quality, and `language-polish` does **not** judge scientific content. Run them independently on the same manuscript to get both dimensions covered.

## scientific-review

Critical review of OR/ML+OR papers and experimental results targeting top-tier journals (OR, MS, TS, POM, EJOR, IJOC).

**Key mechanisms:**

- **Science vs. engineering review.** Elevates the review dimension from implementation correctness to academic validity — catching cases where correct code produces academically questionable results (e.g., a scheduling model outputting $x = -5$ units, or a VSS of 0.01% that undermines the stochastic model's value).
- **Domain detection.** Scans code and drafts to classify the sub-domain (mathematical programming, stochastic/robust optimization, decomposition algorithms, combinatorial optimization, ML+OR), then applies targeted checklists.
- **Adversarial review.** A strict three-round dialogue — Reviewer challenges, Author defends on academic evidence, Judge rules (Resolved / Query Remains / Critical Issue). This protects counter-intuitive innovations while confirming genuine flaws.

```
/scientific-review <path-to-results-or-draft>
```

## language-polish

Academic English editing for LaTeX manuscripts in OR/ML. Polishes grammar, word choice, sentence structure, logic flow, and academic tone while preserving all LaTeX markup (`\cite`, `\label`, math, comments untouched).

Trigger phrases: "polish this section", "check my English", "make it more academic", "improve the writing".

```
/language-polish <selected text or .tex file>
```

## jargon-check

Audits prose for wording that sounds like it came from a coding assistant, CLI summary, or ad hoc explanation rather than a polished paper. Its goal is **paper alignment**: reusing the paper's own method names and terminology, keeping a consistent academic register across sections and response letters.

Trigger phrases: "检查学术黑话", "这句不像论文", "贴合论文术语", "术语要统一", "is this wording too buzzword-heavy?".

```
/jargon-check <text or phrase in question>
```

## rebuttal

Point-by-point rebuttal agent for the revision round. It auto-locates the response letter and manuscript, then processes reviewer comments one at a time: analyze the concern → propose a modification plan (location, ADD/MODIFY/DELETE, Before→After) → **wait for user confirmation** → apply `\changed{}`/`\deleted{}` markup edits → compile both PDFs → update the response letter with professional tone templates → mark `[COMPLETED]` and move on.

Trigger phrases: "回复审稿意见", "逐条回应审稿人", "rebuttal", "response letter".

```
/rebuttal
```

## Installation

Clone the repository and run the installer, which symlinks all four skills into `~/.agents/skills/` (created if missing):

```bash
git clone https://github.com/pengkangzhen/academic-writing-toolkit.git
cd academic-writing-toolkit
./install.sh
```

The installer is idempotent — re-running updates stale links and never overwrites a real directory. To install manually:

```bash
ln -s "$(pwd)/skills/scientific-review" ~/.agents/skills/scientific-review
ln -s "$(pwd)/skills/language-polish" ~/.agents/skills/language-polish
ln -s "$(pwd)/skills/jargon-check" ~/.agents/skills/jargon-check
ln -s "$(pwd)/skills/rebuttal" ~/.agents/skills/rebuttal
```

Adjust the target directory if your assistant reads skills from elsewhere (e.g., `~/.claude/skills/`).

## License

MIT License - see [LICENSE](LICENSE)
