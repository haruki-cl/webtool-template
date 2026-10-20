import { Hono } from "hono";

type Bindings = {
  DB: D1Database;
};

const app = new Hono<{ Bindings: Bindings }>();

// 動作確認用。API はこの下に足していく
app.get("/api/health", (c) => c.json({ ok: true }));

export default app;
