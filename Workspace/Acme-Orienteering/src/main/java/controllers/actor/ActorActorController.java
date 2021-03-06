package controllers.actor;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.ActorService;
import services.form.ActorFormService;

import controllers.AbstractController;
import domain.Actor;
import domain.form.ActorForm;

@Controller
@RequestMapping(value = "/actor/actor")
public class ActorActorController extends AbstractController {

	// Services ----------------------------------------------------------
	@Autowired
	private ActorFormService actorFormService;
	
	@Autowired
	private ActorService actorService;
	
	@Autowired
	private Validator actorFormValidator;

	// Constructors ----------------------------------------------------------

	public ActorActorController() {
		super();
	}

	// Listing ----------------------------------------------------------

	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView display(){
		ModelAndView result;
		Actor actor;
		
		actor = actorService.findByPrincipal();
		
		result = new ModelAndView("actor/display");
		result.addObject("actor", actor);
		
		return result;
	}

	// Creation ----------------------------------------------------------

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(){
		ModelAndView result;
		ActorForm actorForm;
		
		actorForm = actorFormService.createForm(null);
		
		result = createEditModelAndView(actorForm);
		
		return result;
	}

	// Edition ----------------------------------------------------------

	
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid ActorForm customer, BindingResult binding) {
		actorFormValidator.validate(customer, binding);
		
		ModelAndView result;
		
		if(binding.hasErrors()) {
			result = createEditModelAndView(customer);
		} else {
			try {
				customer.setAuthority(null);
				actorFormService.saveForm(customer);
				result = new ModelAndView("redirect:display.do");
			} catch (Throwable oops) {
				result = createEditModelAndView(customer, "actorForm.commit.error");				
			}
		}

		return result;
	}
	
	// Ancillary Methods
	// ----------------------------------------------------------

	protected ModelAndView createEditModelAndView(ActorForm customer) {
		ModelAndView result;

		result = createEditModelAndView(customer, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(ActorForm customer, String message) {
		ModelAndView result;

		result = new ModelAndView("actorForm/edit");
		result.addObject("actorForm", customer);
		result.addObject("message", message);
		result.addObject("urlAction", "actor/actor/edit.do");

		return result;
	}
}
