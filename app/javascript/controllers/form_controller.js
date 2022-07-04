import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  // コントローラーに紐づく要素（=フォーム）をsubmitするアクション
  submit() {
    // セットされているTimeoutをクリア
    clearTimeout(this.timeout)

    // Timeoutをセットする
    // 200ms後にリクエストを実行する
    // 連続実行されるとTimeoutはクリアされるため、最後の処理だけしか実行されない
    this.timeout = setTimeout(() => {
      this.element.requestSubmit()
    }, 900)
  }
}