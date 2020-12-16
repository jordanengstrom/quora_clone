<template>
  <div class="container mt-t">
    <h1 class="mb-3">Edit Your Answer</h1>
    <form @submit.prevent="onSubmit">
      <textarea
        v-model="question_body"
        class="form-control"
        rows="3"
      ></textarea>
      <br />
      <button type="submit" class="btn btn-success">Update your answer</button>
    </form>
    <p v-if="error" class="muted mt-2">{{ error }}</p>
  </div>
</template>

<script>
import { apiService } from "@/common/api.service";

export default {
  name: "AnswerEditor",
  props: {
    id: {
      type: Number,
      required: true
    },
    previouseAnswer: {
      type: String,
      required: true
    },
    questionSlug: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      answerBody: this.previouseAnswer,
      error: null
    };
  },
  methods: {
    onSubmit() {
      if (this.answerBody) {
        let endpoint = `/api/answers/${this.id}/`;
        apiService(endpoint, "PUT", { body: this.answerBody }).then(() => {
          this.$router.push({
            name: "Question",
            params: { slug: questionSlug }
          });
        });
      } else {
        this.error = "You can't submit an empty answer!";
      }
    }
  },
  async beforeRouteEnter(to, from, next) {
    let endpoint = `/api/answers/${to.params.id}/`;
    let data = await apiService(endpoint);
    to.params.previousAnswer = data.body;
    to.params.questionSlug = data.question_slug;
    return next();
  }
};
</script>

<style scoped></style>
