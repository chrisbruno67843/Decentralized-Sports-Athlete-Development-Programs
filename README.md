# Decentralized Sports Athlete Development Programs

A comprehensive blockchain-based system for managing sports athlete development programs using Clarity smart contracts on the Stacks blockchain.

## Overview

This project provides a decentralized platform for sports academies, athletes, trainers, and sponsors to collaborate in athlete development. The system includes five core smart contracts that handle different aspects of the athlete development ecosystem.

## Smart Contracts

### 1. Academy Verification Contract (`academy-verification.clar`)
- **Purpose**: Validates and manages sports development academies
- **Key Features**:
    - Academy registration and verification
    - Academy profile management
    - Verification status tracking
    - Owner-based access control

### 2. Athlete Tracking Contract (`athlete-tracking.clar`)
- **Purpose**: Tracks athlete development progress and profiles
- **Key Features**:
    - Athlete registration and profile management
    - Progress tracking with multiple metrics
    - Academy association
    - Performance history recording

### 3. Training Coordination Contract (`training-coordination.clar`)
- **Purpose**: Coordinates athlete training programs
- **Key Features**:
    - Training program creation and management
    - Athlete enrollment system
    - Participant capacity management
    - Program status tracking

### 4. Performance Assessment Contract (`performance-assessment.clar`)
- **Purpose**: Assesses athlete performance
- **Key Features**:
    - Comprehensive performance assessments
    - Multi-dimensional scoring (technical, physical, mental)
    - Athlete ranking system
    - Assessment history tracking

### 5. Scholarship Management Contract (`scholarship-management.clar`)
- **Purpose**: Manages athlete scholarships and funding
- **Key Features**:
    - Scholarship creation and management
    - Application processing
    - Award distribution
    - Sponsor management

## Architecture

\`\`\`
┌─────────────────────────────────────────────────────────────┐
│                    Stacks Blockchain                        │
├─────────────────────────────────────────────────────────────┤
│  Academy         │  Athlete        │  Training              │
│  Verification    │  Tracking       │  Coordination          │
│  Contract        │  Contract       │  Contract              │
├─────────────────────────────────────────────────────────────┤
│  Performance     │  Scholarship    │                        │
│  Assessment      │  Management     │                        │
│  Contract        │  Contract       │                        │
└─────────────────────────────────────────────────────────────┘
\`\`\`

## Getting Started

### Prerequisites
- Stacks CLI
- Clarinet (for local development)
- Node.js (for testing)

### Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd decentralized-sports-development
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

### Contract Deployment

Deploy contracts to Stacks testnet:

\`\`\`bash
# Deploy academy verification contract
stx deploy_contract academy-verification contracts/academy-verification.clar

# Deploy athlete tracking contract
stx deploy_contract athlete-tracking contracts/athlete-tracking.clar

# Deploy training coordination contract
stx deploy_contract training-coordination contracts/training-coordination.clar

# Deploy performance assessment contract
stx deploy_contract performance-assessment contracts/performance-assessment.clar

# Deploy scholarship management contract
stx deploy_contract scholarship-management contracts/scholarship-management.clar
\`\`\`

## Usage Examples

### Register an Academy
\`\`\`clarity
(contract-call? .academy-verification register-academy
"Elite Sports Academy"
"New York"
"Basketball")
\`\`\`

### Register an Athlete
\`\`\`clarity
(contract-call? .athlete-tracking register-athlete
"John Doe"
u18
"Basketball"
u1)
\`\`\`

### Create Training Program
\`\`\`clarity
(contract-call? .training-coordination create-program
"Advanced Basketball Training"
"Intensive basketball training program"
u1
u1000
u2000
u20)
\`\`\`

### Create Performance Assessment
\`\`\`clarity
(contract-call? .performance-assessment create-assessment
u1
"Basketball"
u90
u80
u85
"Excellent performance")
\`\`\`

### Create Scholarship
\`\`\`clarity
(contract-call? .scholarship-management create-scholarship
"Excellence Scholarship"
"For outstanding athletes"
u5000
"Basketball"
"Minimum 85% performance score"
u2000)
\`\`\`

## Key Features

### Decentralized Governance
- No single point of control
- Community-driven verification
- Transparent operations

### Comprehensive Tracking
- Multi-dimensional athlete profiles
- Progress monitoring
- Performance analytics

### Flexible Program Management
- Customizable training programs
- Enrollment management
- Progress tracking

### Fair Assessment System
- Multi-criteria evaluation
- Transparent scoring
- Historical tracking

### Scholarship Ecosystem
- Merit-based awards
- Transparent application process
- Automated distribution

## Security Features

- Access control mechanisms
- Input validation
- Error handling
- State consistency checks

## Testing

The project includes comprehensive test suites for all contracts using Vitest:

\`\`\`bash
# Run all tests
npm test

# Run specific contract tests
npm test academy-verification
npm test athlete-tracking
npm test training-coordination
npm test performance-assessment
npm test scholarship-management
\`\`\`

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions, please open an issue in the GitHub repository.

## Roadmap

- [ ] Integration with external sports data APIs
- [ ] Mobile application development
- [ ] Advanced analytics dashboard
- [ ] Multi-sport support expansion
- [ ] NFT integration for achievements
- [ ] DAO governance implementation

