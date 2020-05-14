import { Application } from "https://deno.land/x/oak/mod.ts";

const app = new Application();
const PORT: string = Deno.env.get("PORT") || "8000";

console.log("starting the webserver");
app.use((ctx) => {
  ctx.response.body = "Hello World from Cloud Run!";
});

await app.listen({ port: +PORT });
