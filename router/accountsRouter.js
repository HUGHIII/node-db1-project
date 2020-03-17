const express = require("express");
const db = require("../data/dbConfig");
const router = express.Router();

router.get("/", (req, res) => {
  db.select("*")
    .from("accounts")
    .then(rows => {
      res.status(200).json({ data: rows });
    })
    .catch(error => {
      res.status(500).json({ message: "server error" });
    });
});

router.get("/:id", (req, res) => {
  db("accounts")
    .where({ id: req.params.id })
    //.where('id', '=', req.params.id) more similar to sql syntax, passing three arg
    .first() //db returns collection/array unless given method, this returns just object
    .then(account => {
      account
        ? res.status(200).json({ data: account })
        : res.status(404).json({ message: "account not found" });
    })
    .catch(error => {
      res.status(500).json({ message: "server error" });
    });
});

router.post("/", (req, res) => {
  db("accounts")
    .insert(req.body, "id") //sqlite returns id of new record by default,postgres doesn't
    .then(ids => {
      res.status(201).json({ results: ids });
    })
    .catch(error => {
      res.status(500).json({ message: "server error" });
    });
});

router.put("/:id", (req, res) => {
  db("accounts")
    .where({ id: req.params.id })
    .update(req.body)
    .then(newAcc => {
      res.status(200).json({ data: "account updated" });
    })
    .catch(error => {
      res.status(500).json({ message: "server error" });
    });
});

router.delete("/:id", (req, res) => {
  db("accounts")
    .where({ id: req.params.id })
    .del()
    .then(count => {
      count > 0
        ? res.status(200).json({ message: "account deleted" })
        : res.status(404).json({ message: "account not found" });
    })
    .catch(error => {
      res.status(500).json({ message: "server error" });
    });
});

module.exports = router;
