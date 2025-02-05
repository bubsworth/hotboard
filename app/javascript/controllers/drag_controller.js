export default class extends Controller {
  static targets = ["draggable", "dropzone"]
  dropzoneTargetConnected(element) {
    element.addEventListener("dragover", (event) => event.preventDefault())
    element.addEventListener("drop", this.drop)
  }

  drop = () => {
    console.log("DROPPED")
  }

  start(_event) {
    console.log("Started dragging")
  }
}