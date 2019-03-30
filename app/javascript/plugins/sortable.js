import { Sortable } from '@shopify/draggable';

const sortable = new Sortable(document.querySelectorAll('.task'), {
  draggable: '.task-body'
});

// sortable.on('sortable:start', (sortableEvent) => console.log('sortable:start'));
// sortable.on('sortable:sort', (sortableEvent) => console.log('sortable:sort'));
// sortable.on('sortable:sorted', (sortableEvent) => console.log('sortable:sorted'));
sortable.on('sortable:stop', (sortableEvent) => {

  let user_id = sortableEvent.newContainer.dataset.userId;
  let trip_id = window.location.pathname.match(/\d+/)[0];
  let task_id = sortableEvent.data.dragEvent.data.source.dataset.taskId;

  let url = '/trips/'+trip_id+'/tasks/'+task_id;


  let data = {
    task: {
      participant: user_id
    }
  }

  fetch(url, {
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      "credentials": 'include'
    },
    method: 'PATCH',
    body: JSON.stringify(data)
  }).then(function(response) {
    return response.json();
  }).then(function(data) {
  });
});
