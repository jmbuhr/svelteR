import App from './App.svelte';

const app = (targetId, props) => new App({
	target: document.getElementById(targetId),
	props: props
});

window['svelte-app'] = app; //name this the same as your folder
export default app;
