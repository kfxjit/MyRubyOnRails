class PeopleController < ApplicationController

  layout 'people'

  def index
    @msg = 'Person data.'
    @data = Person.all
  end

  def show
  @msg = "Indexed data."
  @data = Person.find(params[:id])
  end

  def add
    @msg = "add new data."
    @person = Person.new
  end


  def create
    @person = Person.new person_params
    if @person.save then
      redirect_to '/people'
    else
      re = ''
      @person.errors.messages.each do |key, vals|
        vals.each do |val|
          re += '<span style="color:red">' + key.to_s +
          '</span> ' + val + '<br>'
        end
      end
      @msg = re.html_safe
      render 'add'
    end
  end

  def edit
    @msg = "edit data.[id = " + params[:id] + "]"
    @person = Person.find(params[:id])
  end


  def update
    obj = Person.find(params[:id])
    obj.update(person_params)
    redirect_to '/people'
  end

  def delete
    obj = Person.find(params[:id])
    obj.destroy
    redirect_to '/people'
  end

  def find
    @msg = 'please type search word...'
    @people = Array.new
    if request.post? then
      #obj = Person.find params['find'] # with id
      #@people.push obj # with id
      #@people = Person.where name: params[:find] # where search
      #@people = Person.where "age >= ?", params[:find] # with expression
      #@people = Person.where "mail like ?", # with like search
      #'%' + params[:find] + '%' #with like search
      #f = params[:find].split ',' # multiple search
      #@people = Person.where "age >= ? and age <= ?", f[0], f[1] # multiple search
      #f = '%' + params[:find] + '%' # or expression
      #@people = Person.where "name like ? or mail like ?", f, f #or expression
      #f = '%' + params[:find] + '%' #first last data
      #result = Person.where "name like ? or mail like ?", f, f #first last data
      #@people.push result.first #first last data
      #@people.push result.last #first last data
      #f = params[:find].split(',') #search multiple id
      #@people = Person.find(f) #search multiple id
      #f = params[:find].split(',') #setting data order
      #@people = Person.where('name like ?', #setting data order
      #  '%' + params[:find] + '%').order 'age asc' #setting data order
      f = params[:find].split(',') #get a part of result
      @people = Person.all.limit(f[0]).offset(f[1]) #get a part of result
    else #get a part of result
      @people = Person.all #get a part of result
    end
  end

  private
  def person_params
    params.require(:person).permit(:name, :age, :mail)
  end

end
