import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";
import Question from "@/views/Question";
import QuestionEditor from "@/views/QuestionEditor";
import AnswerEditor from "@/views/AnswerEditor";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home
  },
  {
    path: "/question/:slug",
    name: "Question",
    component: Question,
    props: true
  },
  {
    path: "/ask/:slug?",
    name: "QuestionEditor",
    component: QuestionEditor,
    props: true
  },
  {
    path: "/answer/:id",
    name: "AnswerEditor",
    component: AnswerEditor,
    props: true
  }
];

const router = new VueRouter({
  mode: "history",
  // base: process.env.BASE_URL,
  routes
});

export default router;
