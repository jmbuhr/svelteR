<script>
	export let name;
	import cat from "./cat.jpeg"

  let count = 0;

	function handleClick() {
		count += 1;
	}
</script>

<main>
	<h1>Hello {name}!</h1>
	<h2>Click this button:</h2>
	<button on:click={handleClick}>
	Clicked {count} {count === 1 ? 'time' : 'times'}
</button>
	<p>Visit the <a href="https://svelte.dev/tutorial">Svelte tutorial</a> to learn how to build Svelte apps.</p>
	<img id="cat" src={cat} alt="A cat!"/>
	<p>Cat image from wikipedia: <a href="https://en.wikipedia.org/wiki/Cat_senses">source</a> </p>
</main>

<style>
	main {
		text-align: center;
		padding: 1em;
		max-width: 240px;
		margin: 0 auto;
	}

	h1 {
		color: #ff3e00;
		text-transform: uppercase;
		font-size: 4em;
		font-weight: 100;
	}
	h2 {
	  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", sans-serif;
		font-size: 4em;
		font-weight: 100;
  }

	#cat {
	  max-width: 70%;
	}

	@media (min-width: 640px) {
		main {
			max-width: none;
		}
	}
</style>
