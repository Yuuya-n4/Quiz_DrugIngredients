import { Autocomplete } from "stimulus-autocomplete"
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["input", "results"]

  connect() {
    new Autocomplete(this.inputTarget, {
      search: this.performSearch.bind(this)
    })
  }

  async performSearch(event) {
    const query = event.target.value
    if (query.length < 1) {
      return;
    }
  
    const timestamp = new Date().getTime();
    const response = await fetch(`/quizzes/search?query=${encodeURIComponent(query)}&timestamp=${timestamp}`)
    if (!response.ok) {
      console.error("検索リクエストに失敗しました")
      return;
    }
  
    const data = await response.json()
    this.updateResults(data)
  }

  updateResults(data) {
    this.resultsTarget.innerHTML = `<ul class="autocomplete-results-list">${data.map(item => {
      return `
        <li class="autocomplete-result-item p-2 hover:bg-gray-100 border-b border-white">
          <strong class="font-bold text-gray-800">質問:</strong> ${item.question}<br>
          <strong class="font-bold text-gray-800">正解:</strong> ${item.correct_answer}<br>
          <strong class="font-bold text-gray-800">説明:</strong> ${item.explanation}<br>
          <strong class="font-bold text-gray-800">クイズセットタイトル:</strong> ${item.quiz_set_title}
        </li>
      `;
    }).join('')}</ul>`;
  }
}