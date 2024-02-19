// process.argv contains the command-line arguments
const args = process.argv.slice(2); // We slice the first two elements

console.log('Hello World!');
console.log('Command-line arguments:', args);

// Define a sleep function
function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

// Use the sleep function
async function main() {
  console.log('Sleeping for 5 minute...');
  await sleep(300000);
  console.log('Resuming execution...');
}

main();
