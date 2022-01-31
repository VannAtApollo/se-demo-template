const fs = require('fs');
const { ApolloServer, gql } = require('apollo-server');
const { buildSubgraphSchema } = require('@apollo/federation');

const dotenv = require('dotenv');
dotenv.config();

// A schema is a collection of type definitions (hence "typeDefs")
// that together define the "shape" of queries that are executed against
// your data.
const schema = gql(fs.readFileSync('schema.graphql', 'utf8'))

const database = require('./database.json');

// This resolver is needed due to Federation type extension. 
// The gateway wants to get all the books for a certain Author.
function fetchBooksForAuthor(author) {
  var booksFound = [];
  for (var i = 0; i < database.length; i++) {
    if (database[i].author === author) {
      booksFound.push(database[i]);
    } 
  }
  return booksFound;
}

// Resolvers define the technique for fetching the types defined in the
// schema. This resolver retrieves books from the "books" array above.
const resolvers = {
    Query: {
      books: () => database,
    },
    Author: {
      books(author) {
        return fetchBooksForAuthor(author.name);
      }
    }
  };
  
// The ApolloServer constructor requires two parameters: your schema
// definition and your set of resolvers.
const server = new ApolloServer({ 
  schema: buildSubgraphSchema([{ typeDefs: schema, resolvers }])
});

const PORT = process.env.PORT || 8080;

// The `listen` method launches a web server.
server.listen({port:PORT}).then(({ url }) => {
  console.log(`🚀  Server ready at ${url}`);
});
