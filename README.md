NoteX iOS

---

## Release
- [0.0.1](#001)
- [0.0.2](#002)
- [0.0.3](#003)

---

# 0.0.1

## List notes (Home page)
- List all current notes
- Each item have: title, created date and overview. Notice: there is no place to input title, *title* is the first line of the note content (similar to OSX Notes)
- There is a textbox at the bottom (look like a chat message box), tap to it will open Create note page. (similar to Google Keep mobile app)
- Tap to item opens note detail page.

<img src="https://user-images.githubusercontent.com/4214509/39516306-c44b59ce-4e26-11e8-85ae-750dfb43eaac.png" width="500"> | <img src="https://www.upanhtocdo.com/images/2018/05/29/Screen-Shot-2018-05-29-at-9.41.06-PM.png" width="300">

## Note detail page
- This page will be used for create/view/edit notes
- Top page show current date time, this is the note created date. Automatically updated when user edit.
- Note content: there is only 1 field, no need to enter title and content.
- No save button, everything entered will be automatically save (could be debounce for 1 seconds or more)

<img src="https://user-images.githubusercontent.com/4214509/39516344-de1085aa-4e26-11e8-8e31-72b413707387.png" width="500"> | <img src="https://www.upanhtocdo.com/images/2018/05/29/Screen-Shot-2018-05-29-at-9.48.11-PM.png" width="300">

---

# 0.0.2

## Fix
- [x] List page: the last item is overlapped by "Take a note" bar.
- [x] Cannot open new note page when tap outside of "Take a note" text.
- [x] Should auto open keyboard when open new note page
- [x] Text is overlapped by keyboard

# Add
- [x] List page: Use "No additional text" if description is empty
- [x] List page: show relative date time format.
- [x] Show "Deleted {note title} [Undo]" message after delete note
- [x] Auto scroll list to top after creating/editing note
- [x] Prevent user from creating note with all whitespace/newlines characters

---

# 0.0.3

## Fix
- [x] App crash if there is no note
- [x] App show "Deleted {nil} [Undo]" if delete a note after creating less than 3 seconds

## Add
- [x] Localization (multi-language): now supporting English and Vietnamese
