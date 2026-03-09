# Academic Review Skill

A Claude Code Skill for critical academic review of Operations Research, ML+OR, and Supply Chain papers targeting top-tier journals.

## Highlights

### 1. Bridging "Code Correctness" vs "Scientific Correctness" Gap

Engineering tools (Claude Code, Cursor) focus on code-level issues, not algorithm-level validity. This skill elevates the review dimension from **Engineering (implementation)** to **Science (principles)**, detecting cases where correct code produces academically questionable results.

> Example: A production scheduling model outputs $x = -5$ units. The code runs without errors, but the result violates basic academic常识 (common sense).

### 2. Dynamic Context-Aware Domain Detection

Generic review prompts are often too broad and lack specificity. This skill automatically scans project code and paper drafts to identify OR/Management Science sub-domains, enabling targeted and precise review recommendations.

**Supported Domains:**
- Mathematical Programming (LP, MIP, NLP)
- Stochastic/Robust Optimization
- Decomposition Algorithms (Benders, PHA, ADMM)
- Network/Combinatorial Optimization (VRP, TSP)
- ML+OR Intersection (RL for optimization, Predict-then-Optimize)

### 3. Adversarial Review Mechanism

Internal dialogue between two agents ensures robust conclusions:

| Role | Responsibility |
|------|----------------|
| **Author Agent** | Defends results, explains academic rationale |
| **Reviewer Agent** | Challenges assumptions, identifies potential flaws |

This mechanism protects counter-intuitive innovations while identifying genuine issues.

### 4. Closed-Loop Agentic Workflow

Reviews experimental results against academic conventions and outputs actionable recommendations executable by downstream agents:

```
Input: Experimental results / Paper draft
  ↓
Phase 1: Domain Detection
  ↓
Phase 2: Targeted Review (Checklist-based)
  ↓
Phase 3: Adversarial Review (Multi-perspective)
  ↓
Output: Structured review + Action items
```

### 5. Slash Command Integration

Simple invocation:

```
/academic-review <path-to-results>
```

## Target Journals

- Operations Research (OR)
- Management Science (MS)
- Transportation Science (TS)
- Production and Operations Management (POM)
- European Journal of Operational Research (EJOR)
- INFORMS Journal on Computing (IJOC)
- Similar top-tier OR/ML+OR venues

## Installation

### Method 1: Manual Installation

```bash
# Create skills directory if not exists
mkdir -p ~/.claude/skills/academic-review-skill

# Copy the SKILL.md file
cp skills/academic-reviewer-or/SKILL.md ~/.claude/skills/academic-review-skill/
```

### Method 2: Clone and Link

```bash
# Clone the repository
git clone https://github.com/pengkangzhen/academic-review-skill.git
cd academic-review-skill

# Create symbolic link
mkdir -p ~/.claude/skills
ln -s $(pwd)/skills/academic-reviewer-or ~/.claude/skills/
```

## Usage

In Claude Code, invoke the skill:

```
/academic-review results/pha_vs_dep_S-03-10
```

Then provide your code, model, or experimental results for review.

### Example

```
/academic-review ./experiments/stochastic_optimization/

I've implemented a Progressive Hedging Algorithm variant with adaptive penalty updates.
Here are my convergence results comparing to standard PHA...
```

## Review Output

The skill provides structured feedback:

- **Domain Detection Results** - Identified research area with evidence
- **Overall Assessment** - Publication potential (Strong/Acceptable/Weak/Reject)
- **Adversarial Review Dialogues** - Author/Reviewer debates on key issues
- **Critical Issues** - Must address before submission
- **Moderate Issues** - Should address for stronger paper
- **Minor Issues** - Polish suggestions
- **Recommendations** - Concrete next steps

## Specialized Checks

### For Stochastic Programming
- VSS (Value of Stochastic Solution) analysis
- EVPI (Expected Value of Perfect Information)
- Scenario generation methodology
- Solution stability tests

### For Decomposition Algorithms (PHA, Benders, etc.)
- Penalty parameter justification
- Convergence criteria
- Comparison against DEP (Deterministic Equivalent Problem)
- Primal/dual residual tracking

### For ML+OR Intersection
- Training/validation/test split design
- Reward function alignment (RL)
- Smart Predict-then-Optimize (SPO) loss
- Generalization to unseen instances

## Requirements

- Claude Code CLI
- Claude Opus model recommended for best results

## License

MIT License - see [LICENSE](LICENSE)

## Contributing

Issues and pull requests welcome!
