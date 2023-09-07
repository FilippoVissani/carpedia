const config = require('semantic-release-preconfigured-conventional-commits')

const releaseBranches = ["master"]
config.branches = releaseBranches
config.plugins.push(
    ["@semantic-release/exec", {
    }],
    ["@semantic-release/github", {
        "assets": [
            // Change this path if your pdf has another name.
            { "path": "docs/thesis-main.pdf" },
            { "path": "ontology_generator/*.owl"},
            { "path": "ontology_generator/*.ttl"},
            { "path": "ontology_generator/*.rdfxml"},
        ]
    }],
    ["@semantic-release/git", {
        "assets": ["CHANGELOG.md", "package.json"],
        "message": "chore(release)!: [skip ci] ${nextRelease.version} released"
    }],
)
module.exports = config